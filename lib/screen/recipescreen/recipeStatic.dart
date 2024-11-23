import 'package:cook_book/const/colors.dart';
import 'package:cook_book/db/model/data_model/meal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Recipestatic extends StatelessWidget {
  Meal mealinfo;
  Recipestatic({super.key, required this.mealinfo});

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
                    image: NetworkImage(mealinfo.imageUrl), fit: BoxFit.cover),
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
                              mealinfo.title,
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
                                          '${mealinfo.duration}mins | Easy |  '),
                                  const WidgetSpan(
                                    child: Icon(
                                      Icons.star,
                                      color: Color(primary),
                                      size: 20,
                                    ),
                                  ),
                                  TextSpan(text: mealinfo.rating),
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
                          child: Text(
                            'Ingredients(${mealinfo.ingredients.length})',
                            style: GoogleFonts.poppins(
                                color: Color(primary),
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: mealinfo.ingredients.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    mealinfo.ingredients[index],
                                    style: GoogleFonts.poppins(
                                        color: const Color(primary)),
                                  ),
                                  Text(mealinfo.qty[index],
                                      style: GoogleFonts.poppins(
                                          color: const Color(primary))),
                                ],
                              ),
                              leading: Icon(
                                Icons.circle,
                                size: 20,
                                color: Color(primary),
                              ),
                              // trailing:
                              //     Icon(Icons.check_box_outline_blank_outlined),
                            );
                          },
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Directions',
                            style: GoogleFonts.poppins(
                                color: Color(primary),
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: mealinfo.steps.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                                title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Step ${index + 1}',
                                    style: GoogleFonts.poppins(
                                        color: const Color(primary))),
                                Text(mealinfo.steps[index],
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
}
