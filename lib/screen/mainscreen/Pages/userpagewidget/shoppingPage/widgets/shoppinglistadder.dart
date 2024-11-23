import 'package:cook_book/const/colors.dart';
import 'package:cook_book/db/dbfunction/ingredients_notifier.dart';
import 'package:cook_book/db/model/shoppinglist_model/shoppinglist_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Shoppinglistadder extends StatefulWidget {
  const Shoppinglistadder({super.key});

  @override
  State<Shoppinglistadder> createState() => _ShoppinglistadderState();
}

class _ShoppinglistadderState extends State<Shoppinglistadder> {
  final _key_safe = GlobalKey<FormState>();
  final ingredientname = TextEditingController();
  final qty = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add to Cart',
          style: GoogleFonts.poppins(color: Colors.white),
        ),
        backgroundColor: Color(primary),
      ),
      body: Form(
        key: _key_safe,
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.white,
                  child: TextFormField(
                    style: const TextStyle(color: Colors.black),
                    controller: ingredientname,
                    decoration: const InputDecoration(
                      hintText: 'Ingredient Name',
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff03E079))),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Provide Ingredient';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.white,
                  child: TextFormField(
                    controller: qty,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff03E079))),
                        hintText: 'Qty required',
                        hintStyle: TextStyle(color: Colors.black)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Provide quantity';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white),
                      child: const Text(
                        'Back',
                        style: TextStyle(color: Color(primary)),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (ingredientname.text.isEmpty || qty.text.isEmpty) {
                          _key_safe.currentState!.validate();
                        } else {
                          Navigator.of(context).pop();
                          //print(_student_batchController.text);
                          addIngredientAddButtonclick(
                              ingredientname: ingredientname, qty: qty);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(primary),
                      ),
                      child: const Text(
                        'Add',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
