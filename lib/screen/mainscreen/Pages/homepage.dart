import 'package:cook_book/const/colors.dart';
import 'package:cook_book/db/data/dummy_data.dart';
import 'package:cook_book/screen/mainscreen/Pages/addCategory/addCategory.dart';
import 'package:cook_book/screen/mainscreen/Pages/homepagewidget/categoryItem.dart';
import 'package:cook_book/screen/mainscreen/Pages/homepagewidget/explore.dart';
import 'package:cook_book/screen/mainscreen/Pages/homepagewidget/searchbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'What are you',
                  style: GoogleFonts.poppins(
                      fontSize: 24, fontWeight: FontWeight.w500),
                ),
                RichText(
                  text:
                      TextSpan(style: const TextStyle(fontSize: 24), children: [
                    TextSpan(
                      text: 'cooking ',
                      style: GoogleFonts.poppins(
                          color: const Color(primary),
                          fontWeight: FontWeight.w500),
                    ),
                    TextSpan(
                        text: 'today?',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500, color: Colors.black))
                  ]),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Searchbar(),
                const SizedBox(
                  height: 10,
                ),
                const Explore(),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Categories',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => const Addcategory()));
                        },
                        icon: const Icon(Icons.add))
                  ],
                ),
                SizedBox(
                  width: 430,
                  height: 140,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      for (final category in availableCategories)
                        Categoryitem(category: category)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Recommendation',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
