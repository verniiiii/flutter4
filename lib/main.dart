import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Список рецептов - Без переполнения'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Мои рецепты', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('Омлет с сыром'),
            Text('Паста карбонара'),
            Text('Салат Цезарь'),
            Text('Борщ'),
            Text('Панкейки'),
          ],
        ),
      ),
    );
  }
}