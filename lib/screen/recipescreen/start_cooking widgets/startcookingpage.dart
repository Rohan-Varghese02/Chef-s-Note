import 'package:cook_book/const/colors.dart';
import 'package:cook_book/db/model/data_model/meal.dart';
import 'package:cook_book/screen/recipescreen/shoppinglistfn.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Startcookingpage extends StatelessWidget {
  Meal mealinfo;
  Startcookingpage({super.key, required this.mealinfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          mealinfo.title,
          style: GoogleFonts.poppins(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: const Color(primary),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white, // Background color of the container
                  borderRadius:
                      BorderRadius.circular(10), // Optional: Rounded corners
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 77, 172, 167)
                          .withOpacity(0.5), // Shadow color and opacity
                      spreadRadius: 3, // How much the shadow spreads
                      blurRadius: 5, // How soft the shadow is
                      offset: const Offset(
                          2, 3), // Horizontal and vertical shadow offsets
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      'INGREDIENTS (${mealinfo.ingredients.length})',
                      style: GoogleFonts.poppins(
                          color: const Color(primary),
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: mealinfo.ingredients.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                mealinfo.ingredients[index],
                                style: GoogleFonts.poppins(
                                    color: const Color(primary)),
                              ),
                              Row(
                                children: [
                                  Text(mealinfo.qty[index],
                                      style: GoogleFonts.poppins(
                                          color: const Color(primary))),
                                  IconButton(
                                    onPressed: () {
                                      showCustomDialog(
                                        context,
                                        mealinfo.ingredients[index],
                                        mealinfo.qty[index],
                                      );
                                    },
                                    icon: const Icon(Icons.shopping_bag),
                                    color: const Color(primary),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          leading: const Icon(
                            Icons.circle,
                            size: 20,
                            color: Color(primary),
                          ),
                          // trailing:
                          //     Icon(Icons.check_box_outline_blank_outlined),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(primary),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 75, vertical: 13),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Next',
                        style: GoogleFonts.poppins(color: Colors.white),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
