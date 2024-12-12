// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:cook_book/const/colors.dart';
import 'package:cook_book/db/model/custom_category/custom_cat_model.dart';
import 'package:cook_book/screen/main_screen/Pages/create_page_widget/functions/recfunc.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:hive_flutter/hive_flutter.dart';

class Recipedetails extends StatefulWidget {
  int? selectedCategoryId;
  GlobalKey<FormState> key_form;
  TextEditingController? name;
  TextEditingController time = TextEditingController();
  TextEditingController rating = TextEditingController();
  List<TextEditingController> listcontroller = [TextEditingController()];
  List<TextEditingController> quantitycontroller = [TextEditingController()];
  List<TextEditingController> directioncontroller = [TextEditingController()];
  final Function(int?) onCategpryChanged;
  final Function(String?) onDifficultyChaged;

  Recipedetails({
    super.key,
    required this.selectedCategoryId,
    required this.onCategpryChanged,
    required this.name,
    required this.time,
    required this.rating,
    required this.key_form,
    required this.listcontroller,
    required this.quantitycontroller,
    required this.directioncontroller,
    required this.onDifficultyChaged,
  });

  @override
  State<Recipedetails> createState() => _RecipedetailsState();
}

class _RecipedetailsState extends State<Recipedetails> {
  void onDifficultyChanged(String? newDifficulty) {
    setState(() {
      selectedDifficulty = newDifficulty; // Update the selected difficulty
      widget.onDifficultyChaged(newDifficulty);
    });
  }

  String? selectedDifficulty;
  List<String> difficulty = ['Easy', 'Meduim', 'Hard'];

  @override
  Widget build(BuildContext context) {
    final categoryBox = Hive.box<CustomCatModel>('catBox');
    return Form(
      key: widget.key_form,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Recipe Name
          Text(
            'Recipe Name:',
            style: GoogleFonts.poppins(
                color: const Color(primary),
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
          TextFormField(
            controller: widget.name,
            validator: (value) {
              return recipeNameValidation(value);
            },
            decoration: const InputDecoration(
              hintText: 'Name',
              border: OutlineInputBorder(
                borderSide: BorderSide(),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          //Time Required_______________________Start
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Time req(min):',
                    style: GoogleFonts.poppins(
                        color: const Color(primary),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 180,
                    child: TextFormField(
                      controller: widget.time,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        return recipeTimeValidation(value);
                      },
                      decoration: const InputDecoration(
                        hintText: 'Time',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              //Rating Required_______________________Start
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ratings(Out of 5):',
                    style: GoogleFonts.poppins(
                        color: const Color(primary),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 180,
                    child: TextFormField(
                      controller: widget.rating,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        return recipeRatingValidation(value);
                      },
                      decoration: const InputDecoration(
                        hintText: 'Ratings',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          // Drop Down menu
          Row(
            children: [
              const SizedBox(
                width: 6,
              ),
              DropdownButton<String>(
                value: selectedDifficulty,
                items: difficulty.map((String difficulty) {
                  return DropdownMenuItem<String>(
                    value: difficulty,
                    child: Text(difficulty),
                  );
                }).toList(),
                onChanged: onDifficultyChanged,
                hint: const Text("Select Difficulty"),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ingredients:',
                style: GoogleFonts.poppins(
                    color: const Color(primary),
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      widget.listcontroller.add(TextEditingController());
                      widget.quantitycontroller.add(TextEditingController());
                    });
                  },
                  icon: const Icon(Icons.add))
            ],
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.listcontroller.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ingridients ${index + 1}',
                              style: GoogleFonts.poppins(
                                  color: const Color(primary)),
                            ),
                            SizedBox(
                              width: 220,
                              child: TextFormField(
                                validator: (value) {
                                  return recipeingridientsvalidation(value);
                                },
                                decoration: const InputDecoration(
                                    hintText: 'Item',
                                    border: OutlineInputBorder()),
                                controller: widget.listcontroller[index],
                                autofocus: false,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '',
                                style: GoogleFonts.poppins(
                                    color: const Color(primary)),
                              ),
                              TextFormField(
                                validator: (value) {
                                  return recipeQtyvalidation(value);
                                },
                                decoration: const InputDecoration(
                                    hintText: 'Qty',
                                    border: OutlineInputBorder()),
                                controller: widget.quantitycontroller[index],
                                autofocus: false,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    //index != 0
                    //?
                    Column(
                      children: [
                        const Text(''),
                        InkWell(
                          onTap: () {
                            setState(() {
                              widget.quantitycontroller[index].clear();
                              widget.quantitycontroller[index].dispose();
                              widget.quantitycontroller.removeAt(index);
                              widget.listcontroller[index].clear();
                              widget.listcontroller[index].dispose();
                              widget.listcontroller.removeAt(index);
                            });
                          },
                          child: const Icon(
                            Icons.delete,
                            color: Colors.red,
                            size: 34,
                          ),
                        ),
                      ],
                    )
                    //: const SizedBox()
                  ],
                ),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Directions:',
                style: GoogleFonts.poppins(
                    color: const Color(primary),
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      widget.directioncontroller.add(TextEditingController());
                    });
                  },
                  icon: const Icon(Icons.add))
            ],
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.directioncontroller.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Step ${index + 1}:',
                              style: GoogleFonts.poppins(
                                  color: const Color(primary)),
                            ),
                            SizedBox(
                              width: 320,
                              child: TextFormField(
                                validator: (value) {
                                  return recipdirectionvalidation(value, index);
                                },
                                decoration: InputDecoration(
                                    hintText: 'Step ${index + 1}',
                                    border: const OutlineInputBorder()),
                                controller: widget.directioncontroller[index],
                                autofocus: false,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    //index != 0
                    //?
                    Column(
                      children: [
                        const Text(''),
                        InkWell(
                          onTap: () {
                            setState(() {
                              widget.directioncontroller[index].clear();
                              widget.directioncontroller[index].dispose();
                              widget.directioncontroller.removeAt(index);
                            });
                          },
                          child: const Icon(
                            Icons.delete,
                            color: Colors.red,
                            size: 34,
                          ),
                        ),
                      ],
                    ),
                    //: const SizedBox()
                  ],
                ),
              );
            },
          ),
          DropdownButtonFormField<int>(
            value: widget.selectedCategoryId,
            hint: const Text('Select Category'),
            items: categoryBox.values.map((category) {
              return DropdownMenuItem<int>(
                  value: category.id as int, child: Text(category.title));
            }).toList(),
            onChanged: (int? newValue) {
              widget.onCategpryChanged(newValue);
            },
            decoration: const InputDecoration(labelText: 'Category'),
          )
        ],
      ),
    );
  }
}
