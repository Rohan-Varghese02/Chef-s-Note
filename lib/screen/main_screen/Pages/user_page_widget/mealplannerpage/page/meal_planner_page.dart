// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:cook_book/const/colors.dart';
import 'package:cook_book/db/data/dummy_data.dart';
import 'package:cook_book/db/model/data_model/meal.dart';
import 'package:cook_book/screen/main_screen/Pages/user_page_widget/mealplannerpage/page/meal_add_page.dart';
import 'package:cook_book/screen/recipe_screen/static_recipe/recipe_static.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TimetablePage extends StatefulWidget {
  const TimetablePage({super.key});

  @override
  State<TimetablePage> createState() => _TimetablePageState();
}

class _TimetablePageState extends State<TimetablePage> {
  final List<String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  final List<String> times = ['Breakfast', 'Lunch', 'Dinner'];

  Map<String, Meal?> timetable = {};

  @override
  void initState() {
    super.initState();
    _loadTimetable();
  }

  Future<void> _loadTimetable() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, Meal?> loadedTimetable = {};

    for (var day in days) {
      for (var time in times) {
        String key = '$day-$time';
        String? mealJson = prefs.getString(key);

        if (mealJson != null) {
          loadedTimetable[key] = Meal.fromJson(jsonDecode(mealJson));
        } else {
          loadedTimetable[key] = null;
        }
      }
    }
    setState(() {
      timetable = loadedTimetable;
    });
  }

  Future<void> _saveMeal(String day, String time, Meal meal) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String key = '$day-$time';
    await prefs.setString(key, jsonEncode(meal.toJson()));
    await _loadTimetable();
  }

  Future<void> _removeMeal(String day, String time) async {
    // Show confirmation dialog before deletion
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Confirm Deletion',
            style: GoogleFonts.poppins(color: const Color(primary)),
          ),
          content: Text(
            'Are you sure you want to remove $time on $day ?',
            style: GoogleFonts.poppins(color: const Color(primary)),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
              child: Text(
                'Cancel',
                style: GoogleFonts.poppins(color: const Color(primary)),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(primary)),
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                String key = '$day-$time';
                await prefs.remove(key); // Remove meal from SharedPreferences
                await _loadTimetable(); // Reload timetable
                Navigator.of(context).pop(); // Close dialog
              },
              child: Text(
                'Remove',
                style: GoogleFonts.poppins(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showMealSelectionDialog() {
    String selectedDay = days.first;
    String selectedTime = times.first;
    Meal selectedMeal = dummyMeals.first;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Select Meal',
            style: GoogleFonts.poppins(color: const Color(primary)),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField<Meal>(
                style: GoogleFonts.poppins(color: const Color(primary)),
                value: selectedMeal,
                items: dummyMeals
                    .map((meal) => DropdownMenuItem(
                          value: meal,
                          child: Text(meal.title),
                        ))
                    .toList(),
                onChanged: (value) {
                  selectedMeal = value!;
                },
                decoration: InputDecoration(
                  labelText: 'Meal',
                  labelStyle: GoogleFonts.poppins(color: const Color(primary)),
                ),
              ),
              DropdownButtonFormField<String>(
                style: GoogleFonts.poppins(color: const Color(primary)),
                value: selectedDay,
                items: days
                    .map(
                        (day) => DropdownMenuItem(value: day, child: Text(day)))
                    .toList(),
                onChanged: (value) {
                  selectedDay = value!;
                },
                decoration: InputDecoration(
                  labelText: 'Day',
                  labelStyle: GoogleFonts.poppins(color: const Color(primary)),
                ),
              ),
              DropdownButtonFormField<String>(
                style: GoogleFonts.poppins(color: const Color(primary)),
                value: selectedTime,
                items: times
                    .map((time) =>
                        DropdownMenuItem(value: time, child: Text(time)))
                    .toList(),
                onChanged: (value) {
                  selectedTime = value!;
                },
                decoration: InputDecoration(
                  labelText: 'Time',
                  labelStyle: GoogleFonts.poppins(color: const Color(primary)),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cancel',
                style: GoogleFonts.poppins(color: const Color(primary)),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _saveMeal(selectedDay, selectedTime, selectedMeal);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(primary)),
              child: Text(
                'Save',
                style: GoogleFonts.poppins(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Meal Planner',
          style: GoogleFonts.poppins(color: Colors.white),
        ),
        backgroundColor: const Color(primary),
        centerTitle: true,
      ),
      body: ListView(
        children: days.map((day) {
          return ExpansionTile(
            collapsedShape: const RoundedRectangleBorder(
              side: BorderSide.none,
            ),
            shape: const RoundedRectangleBorder(
              side: BorderSide.none,
            ),
            collapsedIconColor: const Color(primary),
            iconColor: const Color(primary),
            title: Text(
              day,
              style: GoogleFonts.poppins(color: const Color(primary)),
            ),
            children: times.map((time) {
              String key = '$day-$time';
              Meal? meal = timetable[key];

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color of the container
                    borderRadius:
                        BorderRadius.circular(10), // Optional: Rounded corners
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
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        if (meal != null) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => RecipeStatic(
                                    mealinfo: meal,
                                  )));
                        }
                      },
                      child: ListTile(
                        title: Text(
                          '$time: ${meal?.title ?? 'Not added'}',
                          style: GoogleFonts.poppins(
                            color: const Color(primary),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        subtitle: meal != null
                            ? Text(
                                'Duration: ${meal.duration} mins\n'
                                'Raiting: ${meal.rating}\n'
                                'Ingredients: ${meal.ingredients.length}',
                                style: GoogleFonts.poppins(
                                    color: const Color(primary)),
                              )
                            : Text(
                                'Go to recipe page to add or press the button given below',
                                style: GoogleFonts.poppins(
                                    color: const Color(primary))),
                        leading: meal != null
                            ? CircleAvatar(
                                radius: 25,
                                backgroundImage: NetworkImage(meal.imageUrl),
                                backgroundColor: Colors.grey.shade200,
                              )
                            : CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.grey.shade200,
                                child: const Icon(Icons.fastfood,
                                    color: Colors.grey),
                              ),
                        trailing: meal != null
                            ? IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  // Remove meal from timetable
                                  _removeMeal(day, time);
                                },
                              )
                            : null,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => const MealAddPage()));
        },
        backgroundColor: const Color(primary),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
