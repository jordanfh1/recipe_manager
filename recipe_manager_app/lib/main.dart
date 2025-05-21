import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/add_edit_recipe_screen.dart';
import 'screens/recipe_detail_screen.dart';


void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Manager',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/add': (context) => const AddEditRecipeScreen(),
        '/detail': (context) => const RecipeDetailScreen(),
      },
    );
  }
}
