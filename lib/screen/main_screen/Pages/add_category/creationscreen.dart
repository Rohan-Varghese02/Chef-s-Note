import 'package:cook_book/const/colors.dart';
import 'package:cook_book/db/dbnotifiers/category_notifier.dart';
import 'package:cook_book/db/model/custom_category/custom_cat_model.dart';
import 'package:cook_book/screen/main_screen/Pages/add_category/textfields.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Creationscreen extends StatefulWidget {
  const Creationscreen({super.key});

  @override
  State<Creationscreen> createState() => _CreationscreenState();
}

final keyState = GlobalKey<FormState>();
final titleController = TextEditingController();

class _CreationscreenState extends State<Creationscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Category',
          style: GoogleFonts.poppins(fontSize: 30, color: const Color(primary)),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ProfilePicture(image: _image, onImageSelect: selectImage),
              const SizedBox(
                height: 20,
              ),
              Textfields(titleController: titleController, formkey: keyState),
              // Text('Note: Without Picture Category will not be stored!!'),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Cancel',
                      style: GoogleFonts.poppins(
                          color: const Color(primary),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (keyState.currentState!.validate()) {
                          // saveTitleData(titleController.text.trim(), _image);
                          addCategoryButton();
                          Navigator.of(context).pop();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(primary)),
                      child: Text(
                        'Save',
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addCategoryButton() async {
    final title = titleController.text.trim();
    if (title.isEmpty) {
      return;
    }
    final category = CustomCatModel(title: title, titlePic: null);
    addCategory(category);
  }
}
