import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Создаем список из 100 рецептов
    final recipes = List.generate(100, (index) => 'Рецепт ${index + 1}');

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Список рецептов - С переполнением'),
        ),
        body: Column(
          children: <Widget>[
            Text('Все мои рецепты', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            // Добавляем все рецепты в Column - это вызовет переполнение
            ...recipes.map((recipe) => Text(recipe)),
          ],
        ),
      ),
    );
  }
}