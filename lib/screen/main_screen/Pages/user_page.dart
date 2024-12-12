import 'dart:typed_data';

import 'package:cook_book/const/colors.dart';
import 'package:cook_book/db/model/usermodel/user_model.dart';
import 'package:cook_book/screen/main_screen/Pages/user_page_widget/categorybtn/categorybtn.dart';
import 'package:cook_book/screen/main_screen/Pages/user_page_widget/editprofile.dart';
import 'package:cook_book/screen/main_screen/Pages/user_page_widget/mealplannerpage/meal_planner_button.dart';
import 'package:cook_book/screen/main_screen/Pages/user_page_widget/settingspage/contents/settingsbutton.dart';
import 'package:cook_book/screen/main_screen/Pages/user_page_widget/shoppingPage/shoppinglistbutton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

// The main UserPage where user information is displayed
class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  String? userName;
  Uint8List? profilePicture;
  List<String>? favoriteCuisines;

  @override
  void initState() {
    super.initState();
    _loadUserData(); // Load the data when the widget initializes
  }

  // Load data from Hive
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

  // Navigate to Edit User Page
  void _navigateToEditPage() async {
    // Push the EditUserPage and get updated data back
    final updatedUser = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditUserPage(
          currentName: userName,
          currentProfilePic: profilePicture,
          currentCuisines: favoriteCuisines,
        ),
      ),
    );

    // If updated data is received, update the state
    if (updatedUser != null) {
      setState(() {
        userName = updatedUser.name;
        profilePicture = updatedUser.profilePic;
        favoriteCuisines = updatedUser.cuisine;
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
        actions: [
          IconButton(
            icon: const Icon(
              Icons.edit,
              color: Color(primary),
            ),
            onPressed: _navigateToEditPage, // Open the EditUserPage
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
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
                      ? MemoryImage(profilePicture!)
                      : null,
                  child: profilePicture == null
                      ? const Icon(Icons.person, size: 50)
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
                const SizedBox(height: 10),

                const Shoppinglistbutton(),
                const SizedBox(
                  height: 10,
                ),
                const Mealplannerbutton(),
                const SizedBox(
                  height: 10,
                ),
                const Categorybtn(),
                const SizedBox(
                  height: 10,
                ),
                const Settingsbutton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
