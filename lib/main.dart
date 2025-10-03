import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Кулинарная книга',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const RecipeListBuilder(),
    );
  }
}

class RecipeListBuilder extends StatelessWidget {
  const RecipeListBuilder({super.key});

  final List<Map<String, dynamic>> recipes = const [
    {'title': 'Омлет с сыром', 'time': '20 мин', 'type': 'Завтрак'},
    {'title': 'Спагетти Болоньезе', 'time': '45 мин', 'type': 'Обед'},
    {'title': 'Куриный суп', 'time': '35 мин', 'type': 'Обед'},
    {'title': 'Гречневая каша', 'time': '25 мин', 'type': 'Завтрак'},
    {'title': 'Стейк из лосося', 'time': '30 мин', 'type': 'Ужин'},
    {'title': 'Овощной салат', 'time': '15 мин', 'type': 'Перекус'},
    {'title': 'Шоколадные маффины', 'time': '50 мин', 'type': 'Десерт'},
    {'title': 'Говядина по-тайски', 'time': '40 мин', 'type': 'Ужин'},
    {'title': 'Фруктовый смузи', 'time': '10 мин', 'type': 'Перекус'},
    {'title': 'Тирамису', 'time': '90 мин', 'type': 'Десерт'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView.builder'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.green[100],
                child: Icon(
                  _getIconForType(recipe['type']),
                  color: Colors.green,
                ),
              ),
              title: Text(recipe['title']),
              subtitle: Text('${recipe['time']} • ${recipe['type']}'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
          );
        },
      ),
    );
  }

  IconData _getIconForType(String type) {
    switch (type) {
      case 'Завтрак':
        return Icons.breakfast_dining;
      case 'Обед':
        return Icons.lunch_dining;
      case 'Ужин':
        return Icons.dinner_dining;
      case 'Десерт':
        return Icons.cake;
      case 'Перекус':
        return Icons.coffee;
      default:
        return Icons.restaurant;
    }
  }
}