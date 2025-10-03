import 'package:flutter/material.dart';

class ListViewSeparatedScreen extends StatefulWidget {
  const ListViewSeparatedScreen({super.key});

  @override
  State<ListViewSeparatedScreen> createState() => _ListViewSeparatedScreenState();
}

class _ListViewSeparatedScreenState extends State<ListViewSeparatedScreen> {
  List<Map<String, String>> recipes = [
    {'title': 'Овощной салат', 'time': '15 мин', 'type': 'Перекус'},
    {'title': 'Шоколадные маффины', 'time': '50 мин', 'type': 'Десерт'},
    {'title': 'Фруктовый смузи', 'time': '10 мин', 'type': 'Перекус'},
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
      case 'Десерт': return Colors.pink;
      case 'Перекус': return Colors.blue;
      default: return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Список: ListView.separated'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: recipes.length,
        separatorBuilder: (context, index) => const Divider(
          color: Colors.grey,
          height: 16,
          thickness: 1,
        ),
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