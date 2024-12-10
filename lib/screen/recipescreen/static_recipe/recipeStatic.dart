import 'package:cook_book/const/colors.dart';
import 'package:cook_book/db/dbnotifiers/ingredients_notifier.dart';
import 'package:cook_book/db/model/data_model/meal.dart';
import 'package:cook_book/db/model/shoppinglist_model/shoppinglist_model.dart';
import 'package:cook_book/screen/recipescreen/static_recipe/widgets/mealplannerdailog.dart';
import 'package:cook_book/screen/recipescreen/static_recipe/widgets/shoppinglistfn.dart';
import 'package:cook_book/screen/recipescreen/static_recipe/widgets/start_cooking%20widgets/startcookingpage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Recipestatic extends StatefulWidget {
  Meal mealinfo;
  Recipestatic({super.key, required this.mealinfo});

  @override
  State<Recipestatic> createState() => _RecipestaticState();
}

class _RecipestaticState extends State<Recipestatic> {
  int servingCount = 1; // Default serving count

  void showServingDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        int tempServingCount = servingCount;

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setDialogState) {
            return AlertDialog(
              title: Text(
                'Add Everything To Cart',
                style: GoogleFonts.poppins(color: const Color(primary)),
              ),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.green),
                        color: Colors.green),
                    child: IconButton(
                      icon: const Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        if (tempServingCount > 1) {
                          setDialogState(() {
                            tempServingCount--;
                          });
                        }
                      },
                    ),
                  ),
                  Container(
                    width: 180,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.5, color: Colors.grey)),
                    child: Center(
                      child: Text(
                        '$tempServingCount',
                        style: GoogleFonts.poppins(
                            color: const Color(primary), fontSize: 18),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.red),
                        color: Colors.red),
                    child: IconButton(
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setDialogState(() {
                          tempServingCount++;
                        });
                      },
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text(
                    'Cancel',
                    style: GoogleFonts.poppins(color: const Color(primary)),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(primary)),
                  onPressed: () {
                    setState(() {
                      servingCount = tempServingCount;
                    });
                    addAllIngredients();
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text(
                    'OK',
                    style: GoogleFonts.poppins(color: Colors.white),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void addAllIngredients() async {
    for (int i = 0; i < widget.mealinfo.ingredients.length; i++) {
      final ingredientName = widget.mealinfo.ingredients[i];
      final baseQuantity = widget.mealinfo.qty[i];
      final adjustedQuantity =
          calculateAdjustedQuantity(baseQuantity, servingCount);

      // Add ingredient to the database
      await addIngredient(
        IngredientModel(
          name: ingredientName,
          quantity: adjustedQuantity,
        ),
      );
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('All ingredients added to the cart!')),
    );
  }

  String calculateAdjustedQuantity(String baseQuantity, int servingCount) {
    final regex = RegExp(r'^(\d+)([a-zA-Z]*)$');
    final match = regex.firstMatch(baseQuantity);

    if (match != null) {
      final baseValue = int.tryParse(match.group(1) ?? '0') ?? 0;
      final unit = match.group(2) ?? '';

      return '${baseValue * servingCount}$unit';
    }

    // Return the original quantity if no match is found
    return baseQuantity;
  }

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
              )),
          IconButton(
            onPressed: showServingDialog,
            icon: const Icon(
              Icons.add_shopping_cart,
              color: Colors.white,
            ),
          ),
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
