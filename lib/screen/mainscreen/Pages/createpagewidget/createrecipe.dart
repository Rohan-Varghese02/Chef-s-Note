import 'dart:typed_data';

import 'package:cook_book/const/colors.dart';
import 'package:cook_book/const/utils.dart';
import 'package:cook_book/db/dbnotifiers/recipe_notifier.dart';
import 'package:cook_book/screen/mainscreen/Pages/createpagewidget/widgets/recipedetails.dart';
import 'package:cook_book/screen/mainscreen/Pages/createpagewidget/widgets/recipepic.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class Createrecipe extends StatefulWidget {
  const Createrecipe({super.key});

  @override
  State<Createrecipe> createState() => _CreaterecipeState();
}

class _CreaterecipeState extends State<Createrecipe> {
  String? difficulty;
  int? categoryId;
  final name = TextEditingController();
  final time = TextEditingController();
  final rating = TextEditingController();
  List<TextEditingController> listcontroller = [TextEditingController()];
  List<TextEditingController> quantitycontroller = [TextEditingController()];
  List<TextEditingController> directioncontroller = [TextEditingController()];
  final formKey = GlobalKey<FormState>();

  Uint8List? _image;
  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  void updateSelectedCategory(int? newCategoryId) {
    setState(() {
      categoryId = newCategoryId;
    });
  }

  void updateDifficulty(String? newDifficulty) {
    setState(() {
      difficulty = newDifficulty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Recipies',
          style: GoogleFonts.poppins(),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Recipepic(image: _image, onImageSelect: selectImage),
              Recipedetails(
                key_form: formKey,
                directioncontroller: directioncontroller,
                listcontroller: listcontroller,
                quantitycontroller: quantitycontroller,
                name: name,
                selectedCategoryId: categoryId,
                onCategpryChanged: updateSelectedCategory,
                time: time,
                rating: rating,
                onDifficultyChaged: updateDifficulty,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Cancel',
                        style: GoogleFonts.poppins(color: const Color(primary)),
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        if (_image == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Add Recipe Picture')),
                          );
                          if (difficulty == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Add Difficulty')),
                            );
                          }
                        } else {
                          storeRecipe(
                            pic: _image,
                            name: name,
                            listcontroller: listcontroller,
                            quantitycontroller: quantitycontroller,
                            directioncontroller: directioncontroller,
                            categoryId: categoryId,
                            time: time,
                            rating: rating,
                            difficulty: difficulty,
                          );
                          print(categoryId);
                          Navigator.of(context).pop();
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(primary)),
                    child: Text(
                      'Save',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
