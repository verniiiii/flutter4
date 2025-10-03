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
        primarySwatch: Colors.orange,
      ),
      home: const RecipeListBasic(),
    );
  }
}

class RecipeListBasic extends StatelessWidget {
  const RecipeListBasic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Основной конструктор ListView'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          const Text(
            'Популярные рецепты',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildRecipeCard('Классический омлет', '15 минут', Icons.breakfast_dining),
          _buildRecipeCard('Паста карбонара', '25 минут', Icons.dinner_dining),
          _buildRecipeCard('Салат Цезарь', '20 минут', Icons.lunch_dining),
          _buildRecipeCard('Домашний борщ', '60 минут', Icons.soup_kitchen),
          _buildRecipeCard('Воздушные панкейки', '30 минут', Icons.cake),
          _buildRecipeCard('Шоколадный мусс', '40 минут', Icons.icecream),
          _buildRecipeCard('Классический омлет', '15 минут', Icons.breakfast_dining),
          _buildRecipeCard('Паста карбонара', '25 минут', Icons.dinner_dining),
          _buildRecipeCard('Салат Цезарь', '20 минут', Icons.lunch_dining),
          _buildRecipeCard('Домашний борщ', '60 минут', Icons.soup_kitchen),
          _buildRecipeCard('Воздушные панкейки', '30 минут', Icons.cake),
          _buildRecipeCard('Шоколадный мусс', '40 минут', Icons.icecream),
        ],
      ),
    );
  }

  Widget _buildRecipeCard(String title, String time, IconData icon) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, color: Colors.orange),
        title: Text(title),
        subtitle: Text(time),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}