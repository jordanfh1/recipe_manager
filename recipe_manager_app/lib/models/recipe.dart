import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Recipe {
  final String id;
  final String title;
  final String description;
  final String ingredients;
  final String method;

  Recipe({
    String? id,
    required this.title,
    required this.description,
    required this.ingredients,
    required this.method,
  }) : id = id ?? uuid.v4();


  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      title: json['title'],
      description: json['description'],
      ingredients: json['ingredients'],
      method: json['method'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'ingredients': ingredients,
      'method': method,
    };
  }
}
