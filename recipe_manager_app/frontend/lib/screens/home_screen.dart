import 'package:flutter/material.dart';
import '../models/recipe.dart';
import 'add_edit_recipe_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Recipe> _recipes = [];

  void _addRecipe(Recipe recipe) {
    setState(() {
      _recipes.add(recipe); // Add the new recipe to the list
    });
  }

  void _deleteRecipe(int index) {
    setState(() {
      _recipes.removeAt(index); // Remove the recipe at the specified index
    });
  }

  void _editRecipe(int index, Recipe updatedRecipe) {
    setState(() {
      _recipes[index] =
          updatedRecipe; // Update the recipe at the specified index
    });
  }

  void _navigateToAddRecipe() async {
    final newRecipe = await Navigator.push<Recipe>(
      context,
      MaterialPageRoute(
        builder: (_) =>
            const AddEditRecipeScreen(), // Navigate to the AddEditRecipeScreen
      ),
    );

    if (newRecipe != null) {
      _addRecipe(newRecipe); // Add the new recipe to the list
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Recipes')),
      body: _recipes.isEmpty
          ? const Center(child: Text('No recipes yet.'))
          : ListView.builder(
              itemCount: _recipes.length,
              itemBuilder: (context, index) {
                final recipe = _recipes[index];
                return ListTile(
                  title: Text(recipe.title),
                  subtitle: Text(recipe.description),
                  onTap: () async {
                    final updatedRecipe = await Navigator.push<Recipe>(
                      context,
                      MaterialPageRoute(
                        builder: (_) => AddEditRecipeScreen(
                          existingRecipe: recipe,
                        ),
                      ),
                    );

                    if (updatedRecipe != null) {
                      _editRecipe(index, updatedRecipe);
                    }
                  },
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _deleteRecipe(index),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddRecipe,
        child: const Icon(Icons.add),
      ),
    );
  }
}
