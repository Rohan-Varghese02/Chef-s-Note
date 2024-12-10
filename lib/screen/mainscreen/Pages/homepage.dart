import 'package:cook_book/const/colors.dart';
import 'package:cook_book/db/data/dummy_data.dart';
import 'package:cook_book/screen/mainscreen/Pages/addCategory/addCategory.dart';
import 'package:cook_book/screen/mainscreen/Pages/homepagewidget/categoryItem.dart';
import 'package:cook_book/screen/mainscreen/Pages/homepagewidget/explore.dart';
import 'package:cook_book/screen/mainscreen/Pages/homepagewidget/searchbar.dart';
import 'package:cook_book/screen/recipescreen/static_recipe/recipeStatic.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final filteredMeals =
        dummyMeals.where((meal) => meal.categories.contains('rec')).toList();
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
                  width: double.infinity,
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
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => Recipestatic(
                                    mealinfo: filteredMeals[index],
                                  )));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors
                                .white, // Background color of the container
                            borderRadius: BorderRadius.circular(
                                10), // Optional: Rounded corners
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(255, 77, 172, 167)
                                    .withOpacity(
                                        0.5), // Shadow color and opacity
                                spreadRadius: 2, // How much the shadow spreads
                                blurRadius: 5, // How soft the shadow is
                                offset: const Offset(2,
                                    3), // Horizontal and vertical shadow offsets
                              ),
                            ],
                          ),
                          height: 90,
                          child: Center(
                            child: ListTile(
                              title: Text(
                                filteredMeals[index].title,
                                style: GoogleFonts.poppins(
                                    color: const Color(primary),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18),
                              ),
                              leading: CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    NetworkImage(filteredMeals[index].imageUrl),
                              ),
                              subtitle: Row(
                                children: [
                                  const Icon(Icons.star,
                                      size: 20, color: Color(primary)),
                                  Text(
                                    filteredMeals[index].rating,
                                    style: GoogleFonts.poppins(fontSize: 16),
                                  ),
                                  const SizedBox(
                                    width: 35,
                                  ),
                                  const Icon(Icons.shopify,
                                      size: 20, color: Color(primary)),
                                  Text(
                                    filteredMeals[index]
                                        .ingredients
                                        .length
                                        .toString(),
                                    style: GoogleFonts.poppins(fontSize: 16),
                                  ),
                                  const SizedBox(
                                    width: 35,
                                  ),
                                  const Icon(Icons.timer,
                                      size: 20, color: Color(primary)),
                                  Text(
                                    '${filteredMeals[index].duration.toString()}mins',
                                    style: GoogleFonts.poppins(fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: filteredMeals.length,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
