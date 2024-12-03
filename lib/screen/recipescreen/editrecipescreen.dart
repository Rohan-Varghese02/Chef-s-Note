import 'dart:typed_data';

import 'package:cook_book/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cook_book/db/dbfunction/recipe_notifier.dart';
import 'package:cook_book/db/model/recipe_model/recipe_model.dart';
import 'package:image_picker/image_picker.dart';

class EditRecipeScreen extends StatefulWidget {
  final RecipeModel data;

  const EditRecipeScreen({super.key, required this.data});

  @override
  State<EditRecipeScreen> createState() => _EditRecipeScreenState();
}

class _EditRecipeScreenState extends State<EditRecipeScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _timeController;
  late TextEditingController _difficultyController;
  late TextEditingController _ratingController;
  late List<TextEditingController> _ingredientsControllers;
  late List<TextEditingController> _directionsControllers;
  late List<TextEditingController> _qtyControllers;
  Uint8List? _selectedImage;
  @override
  void initState() {
    super.initState();

    // Initialize controllers with existing data
    _nameController = TextEditingController(text: widget.data.name);
    _timeController = TextEditingController(text: widget.data.time.toString());
    _difficultyController = TextEditingController(text: widget.data.difficulty);
    _ratingController = TextEditingController(text: widget.data.rating);

    _ingredientsControllers = widget.data.ingridients
        .map((ingredient) => TextEditingController(text: ingredient))
        .toList();
    _qtyControllers =
        widget.data.qty.map((qty) => TextEditingController(text: qty)).toList();

    _directionsControllers = widget.data.direction
        .map((direction) => TextEditingController(text: direction))
        .toList();
    // Load existing image into _selectedImage if available
    _selectedImage = widget.data.recipePic;
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final Uint8List imageBytes = await pickedFile.readAsBytes();
      setState(() {
        _selectedImage = imageBytes;
      });
    }
  }

  @override
  void dispose() {
    // Clean up controllers
    _nameController.dispose();
    _timeController.dispose();
    _difficultyController.dispose();
    _ratingController.dispose();
    _ingredientsControllers.forEach((controller) => controller.dispose());
    _qtyControllers.forEach((controller) => controller.dispose());
    _directionsControllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  Future<void> _saveChanges() async {
    if (_formKey.currentState!.validate()) {
      final updatedRecipe = RecipeModel(
        id: widget.data.id,
        name: _nameController.text,
        time: _timeController.text,
        difficulty: _difficultyController.text,
        rating: _ratingController.text,
        qty: _qtyControllers
            .map((c) => c.text)
            .toList(), // Include updated quantities
        ingridients: _ingredientsControllers.map((c) => c.text).toList(),
        direction: _directionsControllers.map((c) => c.text).toList(),
        recipePic:
            _selectedImage ?? widget.data.recipePic, // Save updated image
        isFav: widget.data.isFav, categoryId: widget.data.categoryId,
      );

      print('Saving updated recipe with ID: ${widget.data.id}');
      await updateRecipe(widget.data.id!, updatedRecipe);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Recipe',
            style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24)),
        centerTitle: true,
        backgroundColor: const Color(primary),
        actions: [
          IconButton(
            onPressed: _saveChanges,
            icon: const Icon(
              Icons.save,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // Display existing or newly selected image using CircleAvatar
                GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.grey[300],
                    backgroundImage: _selectedImage != null
                        ? MemoryImage(_selectedImage!) // New image selected
                        : (widget.data.recipePic != null &&
                                widget.data.recipePic!.isNotEmpty
                            ? MemoryImage(
                                widget.data.recipePic!) // Existing image
                            : null),
                    child: _selectedImage == null &&
                            (widget.data.recipePic == null ||
                                widget.data.recipePic!.isEmpty)
                        ? const Icon(
                            Icons.add_a_photo,
                            size: 40,
                            color: Colors.grey,
                          )
                        : null,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Recipe Name',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(primary),
                      ),
                    ),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter a name' : null,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _timeController,
                  decoration: const InputDecoration(
                    labelText: 'Time (mins)',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(primary),
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter time' : null,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _difficultyController,
                  decoration: const InputDecoration(
                    labelText: 'Difficulty',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(primary),
                      ),
                    ),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter difficulty' : null,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _ratingController,
                  decoration: const InputDecoration(
                    labelText: 'Rating',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(primary),
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter rating' : null,
                ),
                const SizedBox(height: 16),
                Text('Ingredients',
                    style: GoogleFonts.poppins(
                        fontSize: 18, color: const Color(primary))),
                const SizedBox(
                  height: 10,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _ingredientsControllers.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 200,
                              child: TextFormField(
                                validator: (value) => value!.isEmpty
                                    ? 'Please enter Ingredient'
                                    : null,
                                controller: _ingredientsControllers[index],
                                decoration: InputDecoration(
                                  labelText: 'Ingredient ${index + 1}',
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide(),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(primary),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 100,
                              child: TextFormField(
                                validator: (value) =>
                                    value!.isEmpty ? 'Enter Qty' : null,
                                controller: _qtyControllers[index],
                                decoration: InputDecoration(
                                  labelText: 'Quantity ${index + 1}',
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide(),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(primary),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                setState(() {
                                  _ingredientsControllers.removeAt(index);
                                  _qtyControllers.removeAt(
                                      index); // Remove corresponding quantity
                                });
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    );
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(primary),
                    textStyle: GoogleFonts.poppins(),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      _ingredientsControllers.add(TextEditingController());
                      _qtyControllers.add(
                          TextEditingController()); // Add corresponding quantity
                    });
                  },
                  child: const Text('Add Ingredient'),
                ),
                const SizedBox(height: 16),
                Text('Directions',
                    style: GoogleFonts.poppins(
                        fontSize: 18, color: const Color(primary))),
                const SizedBox(height: 10),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _directionsControllers.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                validator: (value) => value!.isEmpty
                                    ? 'Please enter Direction'
                                    : null,
                                controller: _directionsControllers[index],
                                decoration: InputDecoration(
                                  labelText: 'Direction ${index + 1}',
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide(),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(primary),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                setState(() {
                                  _directionsControllers.removeAt(index);
                                });
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    );
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(primary),
                    textStyle: GoogleFonts.poppins(),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      _directionsControllers.add(TextEditingController());
                    });
                  },
                  child: const Text('Add Direction'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
