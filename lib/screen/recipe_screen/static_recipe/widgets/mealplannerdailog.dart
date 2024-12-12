// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:cook_book/const/colors.dart';
import 'package:cook_book/db/model/data_model/meal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> showMealDialog(BuildContext context, Meal meal) async {
  String selectedDay = 'Monday';
  String selectedTime = 'Breakfast';

  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          'Meal Planner',
          style: GoogleFonts.poppins(color: const Color(primary)),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              meal.title,
              style: GoogleFonts.poppins(
                  color: const Color(primary),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            DropdownButtonFormField<String>(
              style: GoogleFonts.poppins(
                  color: const Color(primary), fontWeight: FontWeight.bold),
              value: selectedDay,
              items: [
                'Monday',
                'Tuesday',
                'Wednesday',
                'Thursday',
                'Friday',
                'Saturday',
                'Sunday'
              ]
                  .map((day) => DropdownMenuItem(value: day, child: Text(day)))
                  .toList(),
              onChanged: (value) {
                selectedDay = value!;
              },
              decoration: InputDecoration(
                  labelText: 'Day',
                  labelStyle: GoogleFonts.poppins(color: const Color(primary))),
            ),
            DropdownButtonFormField<String>(
              style: GoogleFonts.poppins(
                  color: const Color(primary), fontWeight: FontWeight.bold),
              value: selectedTime,
              items: ['Breakfast', 'Lunch', 'Dinner']
                  .map((time) =>
                      DropdownMenuItem(value: time, child: Text(time)))
                  .toList(),
              onChanged: (value) {
                selectedTime = value!;
              },
              decoration: InputDecoration(
                  labelText: 'Time',
                  labelStyle: GoogleFonts.poppins(color: const Color(primary))),
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
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();

              // Convert Meal object to JSON string
              String mealJson = jsonEncode(meal.toJson());

              // Save meal JSON using the day-time key
              String key = '$selectedDay-$selectedTime';
              await prefs.setString(key, mealJson);

              Navigator.pop(context);
            },
            style:
                ElevatedButton.styleFrom(backgroundColor: const Color(primary)),
            child: Text(
              'Save',
              style: GoogleFonts.poppins(
                color: Colors.white,
              ),
            ),
          ),
        ],
      );
    },
  );
}
