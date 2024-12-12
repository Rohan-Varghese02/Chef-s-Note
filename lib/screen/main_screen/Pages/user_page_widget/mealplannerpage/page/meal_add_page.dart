import 'dart:convert';

import 'package:cook_book/const/Colors.dart';
import 'package:cook_book/db/data/dummy_data.dart';
import 'package:cook_book/db/model/data_model/meal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MealAddPage extends StatefulWidget {
  const MealAddPage({super.key});

  @override
  State<MealAddPage> createState() => _MealAddPageState();
}

class _MealAddPageState extends State<MealAddPage> {

    Future<void> _saveMeal(String day, String time, Meal meal) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String key = '$day-$time';
    await prefs.setString(key, jsonEncode(meal.toJson()));
    // await _loadTimetable();
  }


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

  @override
  Widget build(BuildContext context) {
    String selectedDay = days.first;
    String selectedTime = times.first;
    Meal selectedMeal = dummyMeals.first;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
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
                  .map((day) => DropdownMenuItem(value: day, child: Text(day)))
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
        ),
      ),
    );
  }
}
