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
        primarySwatch: Colors.purple,
      ),
      home: const RecipeListSeparated(),
    );
  }
}

class RecipeListSeparated extends StatelessWidget {
  const RecipeListSeparated({super.key});

  final List<String> recipes = const [
    'Рецепт 1: Классические сырники',
    'Рецепт 2: Томатный суп с базиликом',
    'Рецепт 3: Курица терияки с рисом',
    'Рецепт 4: Шоколадный фондан',
    'Рецепт 5: Овощи гриль',
    'Рецепт 6: Домашний хлеб',
    'Рецепт 7: Фруктовый пирог',
    'Рецепт 8: Морепродукты паста',
    'Рецепт 9: Цезарь роллы',
    'Рецепт 10: Медовое печенье',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView.separated'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16.0),
        itemCount: recipes.length,
        separatorBuilder: (context, index) => const Divider(
          color: Colors.purple,
          height: 24,
          thickness: 1,
        ),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.purple[50],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    recipes[index],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}