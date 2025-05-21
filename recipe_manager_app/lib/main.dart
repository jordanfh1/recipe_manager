import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/add_edit_recipe_screen.dart';
import 'screens/recipe_detail_screen.dart';


void main() {
  runApp(const RecipeApp());
} // Builds and displays the recipe app widget as the root of the widget tree

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override   // The main widget of the app
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
