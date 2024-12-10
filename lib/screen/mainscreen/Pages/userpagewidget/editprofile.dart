import 'dart:typed_data';

import 'package:cook_book/const/colors.dart';
import 'package:cook_book/db/model/usermodel/user_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:hive/hive.dart'; // Hive package to save the data

class EditUserPage extends StatefulWidget {
  final String? currentName;
  final Uint8List? currentProfilePic;
  final List<String>? currentCuisines;

  const EditUserPage({
    Key? key,
    this.currentName,
    this.currentProfilePic,
    this.currentCuisines,
  }) : super(key: key);

  @override
  State<EditUserPage> createState() => _EditUserPageState();
}

class _EditUserPageState extends State<EditUserPage> {
  final _nameController = TextEditingController();
  final _cuisinesController = TextEditingController();
  Uint8List? updatedProfilePic;

  @override
  void initState() {
    super.initState();
    // Initialize controllers with current data
    _nameController.text = widget.currentName ?? '';
    _cuisinesController.text = widget.currentCuisines?.join(", ") ?? '';
    updatedProfilePic = widget.currentProfilePic;
  }

  // Save the updated user data to Hive and return to the previous page
  void _saveChanges() async {
    final box = await Hive.openBox<UserModel>('userBox');

    // Retrieve the existing user data from Hive
    final existingUser = box.get('user') as UserModel?;

    if (existingUser != null) {
      // If the existing user data is found, update it
      final updatedUser = UserModel(
        name: _nameController.text,
        profilePic: updatedProfilePic ??
            existingUser
                .profilePic, // Use the new profile pic, or keep the old one
        cuisine:
            _cuisinesController.text.split(',').map((e) => e.trim()).toList(),
      );

      // Save the updated user data back to the same key ('user') in Hive
      await box.put('user', updatedUser);

      // Return updated user data back to the previous page
      Navigator.pop(context, updatedUser);
    } else {
      // Handle the case where the user does not exist in the Hive box
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User data not found!')),
      );
    }
  }

  // Pick a new profile image
  void _pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      // Use the state setter to update the profile picture
      final selectedImageBytes = await pickedImage.readAsBytes();

      setState(() {
        updatedProfilePic = selectedImageBytes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: GoogleFonts.poppins(color: const Color(primary)),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile picture
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: updatedProfilePic != null
                    ? MemoryImage(
                        updatedProfilePic!) // Display the new profile picture
                    : null,
                child: updatedProfilePic == null
                    ? const Icon(Icons.person, size: 50)
                    : null,
              ),
            ),
            const SizedBox(height: 20),

            // Name input field
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: GoogleFonts.poppins(color: const Color(primary))),
            ),
            const SizedBox(height: 10),

            // Cuisines input field
            TextField(
              controller: _cuisinesController,
              decoration: InputDecoration(
                  labelText: 'Favorite Cuisines (comma separated)',
                  labelStyle: GoogleFonts.poppins(color: const Color(primary))),
            ),
            const SizedBox(height: 20),

            // Save button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(primary)),
              onPressed: _saveChanges,
              child: Text(
                'Save Changes',
                style: GoogleFonts.poppins(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
