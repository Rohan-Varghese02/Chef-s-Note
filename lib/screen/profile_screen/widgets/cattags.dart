// ignore_for_file: must_be_immutable

import 'package:chips_choice/chips_choice.dart';
import 'package:cook_book/const/colors.dart';
import 'package:flutter/material.dart';

class Cattags extends StatefulWidget {
  List<String> selectedCategories;
  final ValueChanged<List<String>> onCategoryChange;
  Cattags(
      {super.key,
      required this.selectedCategories,
      required this.onCategoryChange});

  @override
  State<Cattags> createState() => _CattagsState();
}

class _CattagsState extends State<Cattags> {
  // List to hold the selected categories (indices of selected items)

  // List of category options
  final List<String> categories = [
    'Italian',
    'Mexican',
    'Indian',
    'Chinese',
    'Korean',
    'American'
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Choose Cuisine:',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Color(primary)),
        ),
        const SizedBox(height: 16),
        ChipsChoice<String>.multiple(
          value: widget.selectedCategories,
          onChanged: (List<String> values) {
            setState(() {
              widget.onCategoryChange(values);
              widget.selectedCategories = values;
              // Print the selected categories to the console
              //print("Selected Categories: ${widget.selectedCategories}");
            });
          },
          choiceItems: C2Choice.listFrom<String, String>(
            source: categories,
            value: (index, item) => item,
            label: (index, item) => item,
          ),
          choiceStyle: const C2ChipStyle(
            iconColor: Colors.amber,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          wrapped: true, // Wrap chips to new line if needed
        ),
        const SizedBox(height: 24),
        const Text(
          'Selected Cuisine:',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Color(primary)),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8.0,
          children: widget.selectedCategories
              .map((category) => Chip(
                    label: Text(
                      category,
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor: const Color(primary),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
