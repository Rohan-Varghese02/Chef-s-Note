import 'package:cook_book/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cook_book/db/dbfunction/ingredients_notifier.dart';
import 'package:cook_book/db/model/shoppinglist_model/shoppinglist_model.dart';

class Getslist extends StatefulWidget {
  const Getslist({super.key});

  @override
  State<Getslist> createState() => _GetslistState();
}

class _GetslistState extends State<Getslist> {
  late SharedPreferences _prefs;
  Map<String, bool> _checkedState =
      {}; // Track the checked state using name + quantity

  @override
  void initState() {
    super.initState();
    _loadCheckedState();
  }

  /// Load checked states from SharedPreferences
  Future<void> _loadCheckedState() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _checkedState = Map<String, bool>.from(
        _prefs.getStringList('checkedState')?.asMap().map((key, value) =>
                MapEntry(value.split(':')[0] + ':' + value.split(':')[1],
                    value.split(':')[2] == 'true')) ??
            {},
      );
    });
  }

  /// Save the current checked states to SharedPreferences
  Future<void> _saveCheckedState() async {
    final List<String> savedStates = _checkedState.entries
        .map((entry) => '${entry.key}:${entry.value}')
        .toList();
    await _prefs.setStringList('checkedState', savedStates);
  }

  /// Delete crossed-out items
  void _removeCrossedOutIngredients() {
    setState(() {
      _checkedState.removeWhere((key, value) {
        if (value) {
          final parts = key.split(":"); // Split to get name and quantity
          final name = parts[0];
          final quantity = parts[1];
          deleteIngredient(
              name, quantity); // Remove from database by name and quantity
        }
        return value; // Remove from map
      });
      _saveCheckedState(); // Save updated state
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ingredientNotifier,
      builder: (BuildContext ctx, List<IngredientModel> ingredientList,
          Widget? child) {
        if (ingredientList.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'No Pending Items To Be Purchased',
                  style: GoogleFonts.poppins(
                      color: const Color(primary),
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
                Text(
                  'Press + button to add Ingredients',
                  style: GoogleFonts.poppins(
                      color: const Color(primary),
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
              ],
            ),
          );
        }
        return Scaffold(
          body: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemBuilder: (ctx, index) {
                    final data = ingredientList[index];
                    // Use a combined key of name and quantity (to avoid conflicts)
                    final key = '${data.name}:${data.quantity}';
                    final isChecked = _checkedState[key] ?? false;

                    return ListTile(
                      title: Text(
                        data.name,
                        style: TextStyle(
                          fontSize: 16,
                          decoration: isChecked
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      subtitle: Text(
                        'Quantity: ${data.quantity}',
                        style: TextStyle(
                          decoration: isChecked
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                _checkedState[key] = value ?? false;
                                _saveCheckedState(); // Save the updated state
                              });
                            },
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (ctx, index) {
                    return const Divider();
                  },
                  itemCount: ingredientList.length,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(primary)),
                    onPressed: _removeCrossedOutIngredients,
                    child: Text(
                      "Clear Cart",
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
