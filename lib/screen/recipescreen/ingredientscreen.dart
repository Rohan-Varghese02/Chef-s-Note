import 'package:flutter/material.dart';

class Ingredientscreen extends StatefulWidget {
  const Ingredientscreen({super.key});

  @override
  State<Ingredientscreen> createState() => _IngredientscreenState();
}

class _IngredientscreenState extends State<Ingredientscreen> {
  List<String> ingredients = [];
  List<String> quantities = [];

  final TextEditingController ingredientController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Ingredients to Buy'),
      content: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(width: 100, child: TextField()),
                SizedBox(
                  width: 10,
                ),
                SizedBox(width: 100, child: TextField()),
              ],
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        ElevatedButton(
          child: const Text('Save'),
          onPressed: () {
            // Save or process the ingredient data here if needed
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
