import 'package:flutter/material.dart';
import '../models/recipe.dart';

class RecipeProvider with ChangeNotifier {
  final List<Recipe> _recipes = [];

  List<Recipe> get recipes => [..._recipes];

  void addRecipe(Recipe recipe) {
    _recipes.add(recipe);
    notifyListeners();
  }

  void updateRecipe(String id, Recipe newRecipe) {
    final index = _recipes.indexWhere((r) => r.id == id);
    if (index >= 0) {
      _recipes[index] = newRecipe;
      notifyListeners();
    }
  }

  void deleteRecipe(String id) {
    _recipes.removeWhere((r) => r.id == id);
    notifyListeners();
  }

  Recipe? getRecipeById(String id) {
    return _recipes.firstWhere((r) => r.id == id);
  }
  
}
