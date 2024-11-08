import 'dart:typed_data';

import 'package:cook_book/const/Colors.dart';
import 'package:cook_book/const/utils.dart';
import 'package:cook_book/screen/profile/widgets/cattags.dart';
import 'package:cook_book/screen/profile/widgets/nametext.dart';
import 'package:cook_book/screen/profile/widgets/proceedbtn.dart';
import 'package:cook_book/screen/profile/widgets/profilephoto.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  Uint8List? _image;
  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  List<String> selectedCategories = [];
  // Callback to update selected categories
  void updateCategories(List<String> categories) {
    setState(() {
      selectedCategories = categories;
    });
  }

  final nameController = TextEditingController();
  final GlobalKey<FormState> keySafe = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // Check if keyboard is open by looking at bottom view insets
    bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PROFILE',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(primary),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics:
            isKeyboardVisible ? const NeverScrollableScrollPhysics() : null,
        child: Center(
          child: Column(
            children: [
              ProfilePicture(image: _image, onImageSelect: selectImage),
              const SizedBox(
                height: 20,
              ),
              Nametext(
                formkey: keySafe,
                nameController: nameController,
              ),
              const SizedBox(
                height: 20,
              ),
              Cattags(
                selectedCategories: selectedCategories,
                onCategoryChange: updateCategories,
              ),
              const SizedBox(
                height: 200,
              ),
              Proceedbtn(
                image: _image,
                formkey: keySafe,
                nameController: nameController,
                selectedCategories: selectedCategories,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
