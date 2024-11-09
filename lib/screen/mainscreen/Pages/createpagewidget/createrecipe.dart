import 'dart:typed_data';

import 'package:cook_book/const/utils.dart';
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
              Recipedetails(),
            ],
          ),
        )),
      ),
    );
  }
}
