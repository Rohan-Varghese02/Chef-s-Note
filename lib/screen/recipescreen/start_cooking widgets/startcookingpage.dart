import 'package:cook_book/const/colors.dart';
import 'package:cook_book/db/model/data_model/meal.dart';
import 'package:cook_book/screen/recipescreen/shoppinglistfn.dart';
import 'package:cook_book/screen/recipescreen/start_cooking%20widgets/directionpage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Startcookingpage extends StatefulWidget {
  Meal mealinfo;

  Startcookingpage({super.key, required this.mealinfo});

  @override
  State<Startcookingpage> createState() => _StartcookingpageState();
}

class _StartcookingpageState extends State<Startcookingpage> {
  // Set to keep track of checked ingredients
  final Set<int> _checkedIngredients = {};

  // Check if all ingredients are marked
  bool get _allIngredientsChecked =>
      _checkedIngredients.length == widget.mealinfo.ingredients.length;

  // Function to select all ingredients
  void _selectAllIngredients() {
    setState(() {
      // If not all ingredients are selected, select all
      if (!_allIngredientsChecked) {
        _checkedIngredients.clear(); // First clear any checked items
        for (int i = 0; i < widget.mealinfo.ingredients.length; i++) {
          _checkedIngredients.add(i); // Add all ingredients to the set
        }
      } else {
        _checkedIngredients.clear(); // Clear all if already selected
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: Text(
          widget.mealinfo.title,
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
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'INGREDIENTS (${widget.mealinfo.ingredients.length})',
                          style: GoogleFonts.poppins(
                              color: const Color(primary),
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                        TextButton(
                          onPressed: _selectAllIngredients,
                          child: Text(
                            _allIngredientsChecked
                                ? 'Deselect All'
                                : 'Select All',
                            style: GoogleFonts.poppins(
                                color: const Color(primary), fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: widget.mealinfo.ingredients.length,
                      itemBuilder: (context, index) {
                        bool isChecked = _checkedIngredients.contains(index);
                        return ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      showCustomDialog(
                                        context,
                                        widget.mealinfo.ingredients[index],
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
                          leading: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (isChecked) {
                                  _checkedIngredients.remove(index);
                                } else {
                                  _checkedIngredients.add(index);
                                }
                              });
                            },
                            child: Icon(
                              isChecked
                                  ? Icons.check_circle
                                  : Icons.cancel, // Green check or Red cross
                              size: 25,
                              color: isChecked ? Colors.green : Colors.red,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const SizedBox(width: 5),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(primary),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 75, vertical: 13),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.arrow_back_ios,
                            size: 15,
                            color: Colors.white,
                          ),
                          Text(
                            'Exit',
                            style: GoogleFonts.poppins(
                                color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  ElevatedButton(
                    onPressed: _allIngredientsChecked
                        ? () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => Directionpage(
                                      mealinfo: widget.mealinfo,
                                    ))); // Navigate to cooking direction
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(primary),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 70, vertical: 13),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Start',
                            style: GoogleFonts.poppins(
                                color: Colors.white, fontSize: 16),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
