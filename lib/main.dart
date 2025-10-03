import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Корректное удаление с Key',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const CorrectDeletionList(),
    );
  }
}

class CorrectDeletionList extends StatefulWidget {
  const CorrectDeletionList({super.key});

  @override
  _CorrectDeletionListState createState() => _CorrectDeletionListState();
}

class _CorrectDeletionListState extends State<CorrectDeletionList> {
  List<Recipe> recipes = [
    Recipe('Омлет с сыром и зеленью', '15 мин', 'Завтрак'),
    Recipe('Паста Карбонара с беконом', '25 мин', 'Обед'),
    Recipe('Салат Цезарь с курицей', '20 мин', 'Обед'),
    Recipe('Домашний борщ со сметаной', '60 мин', 'Обед'),
    Recipe('Воздушные панкейки с сиропом', '30 мин', 'Завтрак'),
    Recipe('Гречневая каша с грибами', '25 мин', 'Ужин'),
    Recipe('Стейк из лосося с лимоном', '35 мин', 'Ужин'),
    Recipe('Овощной салат с заправкой', '15 мин', 'Перекус'),
    Recipe('Шоколадные маффины с вишней', '50 мин', 'Десерт'),
    Recipe('Фруктовый смузи с бананом', '10 мин', 'Перекус'),
  ];

  void _removeRecipe(int index) {
    setState(() {
      recipes.removeAt(index);
    });
  }

  void _addRecipe() {
    setState(() {
      recipes.add(Recipe(
        'Новый рецепт ${recipes.length + 1}',
        '${10 + recipes.length} мин',
        'Разное',
      ));
    });
  }

  Color _getColorForType(String type) {
    switch (type) {
      case 'Завтрак':
        return Colors.orange;
      case 'Обед':
        return Colors.green;
      case 'Ужин':
        return Colors.purple;
      case 'Десерт':
        return Colors.pink;
      case 'Перекус':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Корректное удаление с Key'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return Dismissible(
            key: ValueKey(recipe.title), // Уникальный ключ для каждого элемента
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              child: const Icon(
                Icons.delete,
                color: Colors.white,
                size: 30,
              ),
            ),
            confirmDismiss: (direction) async {
              // Подтверждение удаления
              return await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Подтверждение'),
                    content: Text('Удалить рецепт "${recipe.title}"?'),
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
                  );
                },
              );
            },
            onDismissed: (direction) {
              _removeRecipe(index);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Рецепт "${recipe.title}" удален'),
                  backgroundColor: Colors.red,
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: _getColorForType(recipe.type),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      recipe.type[0],
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                title: Text(
                  recipe.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(recipe.time),
                trailing: Icon(
                  Icons.swipe,
                  color: Colors.grey[400],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addRecipe,
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Recipe {
  final String title;
  final String time;
  final String type;

  Recipe(this.title, this.time, this.type);
}