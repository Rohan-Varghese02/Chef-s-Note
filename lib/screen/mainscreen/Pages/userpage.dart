import 'dart:typed_data';

import 'package:cook_book/const/colors.dart';
import 'package:cook_book/db/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

class Userpage extends StatefulWidget {
  const Userpage({super.key});

  @override
  State<Userpage> createState() => _UserpageState();
}

class _UserpageState extends State<Userpage> {
  String? userName;
  Uint8List? profilePicture;
  List<String>? favoriteCuisines;
  @override
  void initState() {
    super.initState();
    _loadUserData(); // Load the data when the widget initializes
  }

  void _loadUserData() {
    final box = Hive.box<UserModel>('userBox');
    final user =
        box.get('user'); // Retrieve the user data stored with key 'user'

    if (user != null) {
      setState(() {
        userName = user.name;
        profilePicture = user.profilePic;
        favoriteCuisines = user.cuisine;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "User Profile",
          style: GoogleFonts.poppins(
              color: const Color(primary),
              fontWeight: FontWeight.bold,
              fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              // Display profile picture
              CircleAvatar(
                radius: 100,
                backgroundImage: profilePicture != null
                    ? MemoryImage(
                        profilePicture!) // Display profile picture if available
                    : null,
                child: profilePicture == null
                    ? const Icon(Icons.person, size: 50) // Fallback icon
                    : null,
              ),
              const SizedBox(height: 20),

              // Display user name
              Text(
                userName ??
                    "No name available", // Display name or fallback text
                style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color(primary)),
              ),
              const SizedBox(height: 10),

              // Display favorite cuisines
              Text(
                favoriteCuisines != null
                    ? "Favorite Cuisines: ${favoriteCuisines!.join(", ")}"
                    : "No favorite cuisines available",
                style: const TextStyle(
                    fontSize: 24, color: Color.fromARGB(221, 3, 87, 83)),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
