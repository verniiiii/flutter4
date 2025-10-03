import 'package:flutter/material.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({super.key});

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  List<Map<String, String>> recipes = [
    {'title': 'Гречневая каша', 'time': '20 мин', 'type': 'Завтрак'},
    {'title': 'Куриный суп', 'time': '45 мин', 'type': 'Обед'},
    {'title': 'Стейк из лосося', 'time': '30 мин', 'type': 'Ужин'},
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

  void _removeRecipe(int index) {
    setState(() {
      recipes.removeAt(index);
    });
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
        title: const Text('Список: ListView'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(recipes[index]['title']!),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (direction) => _removeRecipe(index),
            child: Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: _getColorForType(recipes[index]['type']!),
                  child: Text(
                    recipes[index]['type']!.substring(0, 1),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                title: Text(recipes[index]['title']!),
                subtitle: Text(recipes[index]['time']!),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addRecipe,
        child: const Icon(Icons.add),
      ),
    );
  }
}