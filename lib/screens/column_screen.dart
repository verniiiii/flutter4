import 'package:flutter/material.dart';

class ColumnScreen extends StatefulWidget {
  const ColumnScreen({super.key});

  @override
  State<ColumnScreen> createState() => _ColumnScreenState();
}

class _ColumnScreenState extends State<ColumnScreen> {
  List<Map<String, String>> recipes = [
    {'title': 'Омлет с сыром', 'time': '15 мин', 'type': 'Завтрак'},
    {'title': 'Паста Карбонара', 'time': '25 мин', 'type': 'Обед'},
    {'title': 'Салат Цезарь', 'time': '20 мин', 'type': 'Обед'},
  ];

  void _addRecipe() {
    setState(() {
      recipes.add({
        'title': 'Новый рецепт ${recipes.length + 1}',
        'time': '${10 + recipes.length} мин',
        'type': 'Разное'
      });
    });
  }

  void _removeRecipe(int index) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Удалить рецепт?'),
        content: Text('Вы уверены, что хотите удалить "${recipes[index]['title']}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Отмена'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Удалить'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      setState(() {
        recipes.removeAt(index);
      });
    }
  }

  Color _getColorForType(String type) {
    switch (type) {
      case 'Завтрак': return Colors.orange;
      case 'Обед': return Colors.green;
      case 'Ужин': return Colors.purple;
      default: return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Список: Column'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            for (int i = 0; i < recipes.length; i++)
              Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: _getColorForType(recipes[i]['type']!),
                    child: Text(
                      recipes[i]['type']!.substring(0, 1),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(recipes[i]['title']!),
                  subtitle: Text(recipes[i]['time']!),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _removeRecipe(i),
                  ),
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addRecipe,
        child: const Icon(Icons.add),
      ),
    );
  }
}