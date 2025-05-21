class Recipe {
  final String id;
  final String title;
  final String description;
  final List<String> ingredients;
  final List<String> steps;
  final List<String>? tags;
  final int? prepTime;
  final int? cookTime;
  final String? image;

  Recipe({
    required this.id,
    required this.title,
    required this.description,
    required this.ingredients,
    required this.steps,
    this.tags,
    this.prepTime,
    this.cookTime,
    this.image,
  });

  // Add toJson/fromJson for persistence or APIs
  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      ingredients: List<String>.from(json['ingredients']),
      steps: List<String>.from(json['steps']),
      tags: json['tags'] != null ? List<String>.from(json['tags']) : null,
      prepTime: json['prepTime'],
      cookTime: json['cookTime'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'ingredients': ingredients,
      'steps': steps,
      'tags': tags,
      'prepTime': prepTime,
      'cookTime': cookTime,
      'image': image,
    };
  }
}
