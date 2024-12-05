import 'package:cook_book/const/colors.dart';
import 'package:cook_book/db/dbfunction/ingredients_notifier.dart';
import 'package:cook_book/db/model/data_model/meal.dart';
import 'package:cook_book/screen/recipescreen/mealplannerdailog.dart';
import 'package:cook_book/screen/recipescreen/shoppinglistfn.dart';
import 'package:cook_book/screen/recipescreen/start_cooking%20widgets/startcookingpage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Recipestatic extends StatefulWidget {
  Meal mealinfo;
  Recipestatic({super.key, required this.mealinfo});

  @override
  State<Recipestatic> createState() => _RecipestaticState();
}

class _RecipestaticState extends State<Recipestatic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        backgroundColor: const Color(primary),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                showMealDialog(context, widget.mealinfo);
              },
              icon: const Icon(
                Icons.fastfood,
                color: Colors.white,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(widget.mealinfo.imageUrl),
                    fit: BoxFit.cover),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color:
                            Colors.white, // Background color of the container
                        borderRadius: BorderRadius.circular(
                            10), // Optional: Rounded corners
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 77, 172, 167)
                                .withOpacity(0.5), // Shadow color and opacity
                            spreadRadius: 2, // How much the shadow spreads
                            blurRadius: 5, // How soft the shadow is
                            offset: const Offset(
                                2, 3), // Horizontal and vertical shadow offsets
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                widget.mealinfo.title,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    color: const Color(primary),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30),
                              ),
                              RichText(
                                text: TextSpan(
                                  style: const TextStyle(
                                      color: Color(primary), fontSize: 18),
                                  children: [
                                    TextSpan(
                                        text:
                                            '${widget.mealinfo.duration}mins | Easy |  '),
                                    const WidgetSpan(
                                      child: Icon(
                                        Icons.star,
                                        color: Color(primary),
                                        size: 20,
                                      ),
                                    ),
                                    TextSpan(text: widget.mealinfo.rating),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              Colors.white, // Background color of the container
                          borderRadius: BorderRadius.circular(
                              10), // Optional: Rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 77, 172, 167)
                                  .withOpacity(0.5), // Shadow color and opacity
                              spreadRadius: 2, // How much the shadow spreads
                              blurRadius: 5, // How soft the shadow is
                              offset: const Offset(2,
                                  3), // Horizontal and vertical shadow offsets
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Ingredients(${widget.mealinfo.ingredients.length})',
                                  style: GoogleFonts.poppins(
                                      color: const Color(primary),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: widget.mealinfo.ingredients.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          widget.mealinfo.ingredients[index],
                                          style: GoogleFonts.poppins(
                                              color: const Color(primary)),
                                        ),
                                        Row(
                                          children: [
                                            Text(widget.mealinfo.qty[index],
                                                style: GoogleFonts.poppins(
                                                    color:
                                                        const Color(primary))),
                                            IconButton(
                                              onPressed: () {
                                                showCustomDialog(
                                                  context,
                                                  widget.mealinfo
                                                      .ingredients[index],
                                                  widget.mealinfo.qty[index],
                                                );
                                              },
                                              icon: const Icon(
                                                  Icons.shopping_bag),
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
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Directions',
                                  style: GoogleFonts.poppins(
                                      color: const Color(primary),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: widget.mealinfo.steps.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                      title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Step ${index + 1}',
                                          style: GoogleFonts.poppins(
                                              color: const Color(primary))),
                                      Text(widget.mealinfo.steps[index],
                                          style: GoogleFonts.poppins(
                                              color: const Color(primary)))
                                    ],
                                  ));
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.transparent,
        elevation: 0,
        onPressed: () {},
        label: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(primary),
                padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 13)),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) =>
                      Startcookingpage(mealinfo: widget.mealinfo)));
            },
            child: Text(
              'Start Cooking',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.white),
            )),
      ),
    );
  }
}
