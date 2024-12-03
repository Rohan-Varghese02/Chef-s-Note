import 'package:cook_book/const/colors.dart';
import 'package:cook_book/db/dbfunction/ingredients_notifier.dart';
import 'package:cook_book/db/model/data_model/meal.dart';
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
                    Padding(
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
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 19.0),
                            child: Text(
                              'Ingredients(${widget.mealinfo.ingredients.length})',
                              style: GoogleFonts.poppins(
                                  color: const Color(primary),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ListView.builder(
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
                                                color: const Color(primary))),
                                        IconButton(
                                          onPressed: () {
                                            _showCustomDialog(
                                              context,
                                              widget
                                                  .mealinfo.ingredients[index],
                                              widget.mealinfo.qty[index],
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
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCustomDialog(
      BuildContext context, String ingredient, String initialQty) {
    int servingCount = 1; // Default serving count
    final TextEditingController qtyController =
        TextEditingController(text: initialQty);
    final TextEditingController ingredientController =
        TextEditingController(text: ingredient);
    String baseQuantity = qtyController.text; // Store the initial quantity
    // ignore: no_leading_underscores_for_local_identifiers
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            backgroundColor: const Color(primary),
            title: Text(
              'Add to Cart',
              style: GoogleFonts.poppins(
                  color: Colors.white, fontWeight: FontWeight.w500),
            ),
            content: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    ingredient,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    style: GoogleFonts.poppins(color: Colors.white),
                    controller: qtyController,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      labelText: 'Quantity',
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Quantity cannot be empty';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      baseQuantity = value;
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Servings:',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.red),
                                color: Colors.red),
                            child: InkWell(
                              child: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                              onTap: () {
                                if (servingCount > 1) {
                                  setState(() {
                                    servingCount--;
                                    updateQuantity(qtyController, baseQuantity,
                                        servingCount);
                                  });
                                }
                              },
                            ),
                          ),
                          SizedBox(
                              width: 26,
                              height: 26,
                              child: Center(
                                  child: Text(
                                servingCount.toString(),
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ))),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.green),
                                color: Colors.green),
                            child: InkWell(
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              onTap: () {
                                setState(() {
                                  servingCount++;
                                  updateQuantity(qtyController, baseQuantity,
                                      servingCount);
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Dismiss the dialog
                },
                child: Text(
                  'Cancel',
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() == true) {
                    addIngredientAddButtonclick(
                        ingredientname: ingredientController,
                        qty: qtyController);
                    Navigator.pop(context); // Dismiss the dialog
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                child: Text(
                  'Add',
                  style: GoogleFonts.poppins(color: const Color(primary)),
                ),
              ),
            ],
          );
        });
      },
    );
  }
}

// Helper function to update the quantity based on servings
void updateQuantity(
    TextEditingController controller, String baseQuantity, int servingCount) {
  final regex = RegExp(r'^(\d+)([a-zA-Z]*)$');
  final match = regex.firstMatch(baseQuantity);

  if (match != null) {
    final baseValue = int.tryParse(match.group(1) ?? '0') ?? 0;
    final unit = match.group(2) ?? '';

    controller.text = '${baseValue * servingCount}$unit';
  }
}
