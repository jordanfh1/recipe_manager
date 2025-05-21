import 'package:flutter/material.dart';

class AddEditRecipeScreen extends StatelessWidget {
  const AddEditRecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add/Edit Recipe')),
      body: const Center(child: Text('Add or edit your recipe here!')),
    );
  }
}
