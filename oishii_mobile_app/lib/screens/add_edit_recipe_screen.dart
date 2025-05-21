import 'package:flutter/material.dart';
import '../models/recipe.dart';

class AddEditRecipeScreen extends StatefulWidget {
  final Recipe? existingRecipe;

  const AddEditRecipeScreen({super.key, this.existingRecipe});

  @override
  State<AddEditRecipeScreen> createState() => _AddEditRecipeScreenState();
}

class _AddEditRecipeScreenState extends State<AddEditRecipeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _ingredientsController = TextEditingController();
  final _methodController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.existingRecipe != null) {
      _titleController.text = widget.existingRecipe!.title;
      _descriptionController.text = widget.existingRecipe!.description;
      _ingredientsController.text = widget.existingRecipe!.ingredients;
      _methodController.text = widget.existingRecipe!.method;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _ingredientsController.dispose();
    _methodController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final recipe = Recipe(
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim(),
        ingredients: _ingredientsController.text.trim(),
        method: _methodController.text.trim(),
);

      Navigator.pop(context, recipe); // return recipe to HomeScreen
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.existingRecipe != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Recipe' : 'Add Recipe'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter a title' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
                validator: (value) => value == null || value.isEmpty
                    ? 'Enter a description'
                    : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _ingredientsController,
                decoration: const InputDecoration(labelText: 'Ingredients'),
                maxLines: 3,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter ingredients' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _methodController,
                decoration: const InputDecoration(labelText: 'Method'),
                maxLines: 6,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter the method' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text(isEditing ? 'Update Recipe' : 'Add Recipe'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
