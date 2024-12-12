import 'package:cook_book/const/colors.dart';
import 'package:cook_book/db/dbnotifiers/ingredients_notifier.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void showCustomDialog(
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
                                updateQuantity(
                                    qtyController, baseQuantity, servingCount);
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
                      ingredientname: ingredientController, qty: qtyController);
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
