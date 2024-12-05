import 'package:cook_book/const/colors.dart';
import 'package:cook_book/db/model/data_model/meal.dart';
import 'package:cook_book/screen/recipescreen/recipeStatic.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Categorydetails extends StatelessWidget {
  const Categorydetails({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.separated(
      itemBuilder: (ctx, index) {
        final mealinfo = meals[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => Recipestatic(
                        mealinfo: mealinfo,
                      )));
            },
            child: Container(
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
              height: 90,
              child: Center(
                child: ListTile(
                  title: Text(
                    mealinfo.title,
                    style: GoogleFonts.poppins(
                        color: const Color(primary),
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(mealinfo.imageUrl),
                  ),
                  subtitle: Row(
                    children: [
                      const Icon(Icons.star, size: 20, color: Color(primary)),
                      Text(
                        mealinfo.rating,
                        style: GoogleFonts.poppins(fontSize: 16),
                      ),
                      const SizedBox(
                        width: 35,
                      ),
                      const Icon(Icons.shopify,
                          size: 20, color: Color(primary)),
                      Text(
                        mealinfo.ingredients.length.toString(),
                        style: GoogleFonts.poppins(fontSize: 16),
                      ),
                      const SizedBox(
                        width: 35,
                      ),
                      const Icon(Icons.timer, size: 20, color: Color(primary)),
                      Text(
                        '${mealinfo.duration.toString()}mins',
                        style: GoogleFonts.poppins(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
      itemCount: meals.length,
      separatorBuilder: (context, index) {
        return const SizedBox();
      },
    );
    if (meals.isEmpty) {
      content = const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Uh oh.... nothing here!'),
            SizedBox(height: 16),
            Text('Try Selecting Different Category!')
          ],
        ),
      );
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(
            title,
            style: GoogleFonts.poppins(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: const Color(primary),
        ),
        body: content);
  }
}
