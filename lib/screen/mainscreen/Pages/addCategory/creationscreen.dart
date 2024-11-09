import 'dart:typed_data';

import 'package:cook_book/const/colors.dart';
import 'package:cook_book/const/utils.dart';
import 'package:cook_book/db/dbfunction/category_notifier.dart';
import 'package:cook_book/db/model/custom_cat_model.dart';
import 'package:cook_book/screen/mainscreen/Pages/addCategory/textfields.dart';
import 'package:cook_book/screen/profile/widgets/profilephoto.dart';
//import 'package:cook_book/screen/profile/widgets/profilephoto.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';

class Creationscreen extends StatefulWidget {
  const Creationscreen({super.key});

  @override
  State<Creationscreen> createState() => _CreationscreenState();
}

final keyState = GlobalKey<FormState>();
final titleController = TextEditingController();

class _CreationscreenState extends State<Creationscreen> {
  Uint8List? _image;
  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

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
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                ProfilePicture(image: _image, onImageSelect: selectImage),
                const SizedBox(
                  height: 20,
                ),
                Textfields(titleController: titleController, formkey: keyState),
                Text('Note: Without Picture Category will not be stored!!'),
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
                          if (keyState.currentState!.validate() &&
                              _image != null) {
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
      ),
    );
  }

  Future<void> addCategoryButton() async {
    final _title = titleController.text.trim();
    final image = _image;
    print(_title);
    if (_title.isEmpty || image == null) {
      return;
    }
    final _category = CustomCatModel(title: _title, titlePic: image);
    addCategory(_category);
  }
}
