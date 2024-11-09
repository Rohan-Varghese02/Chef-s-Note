import 'package:cook_book/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:hive_flutter/hive_flutter.dart';

class Recipedetails extends StatefulWidget {
  const Recipedetails({super.key});

  @override
  State<Recipedetails> createState() => _RecipedetailsState();
}

class _RecipedetailsState extends State<Recipedetails> {
  List<TextEditingController> listcontroller = [TextEditingController()];
  List<TextEditingController> quantitycontroller = [TextEditingController()];
  List<TextEditingController> directioncontroller = [TextEditingController()];

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recipe Name:',
            style: GoogleFonts.poppins(
                color: const Color(primary),
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
          TextFormField(
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
                      listcontroller.add(TextEditingController());
                      quantitycontroller.add(TextEditingController());
                    });
                  },
                  icon: const Icon(Icons.add))
            ],
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: listcontroller.length,
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
                                decoration: const InputDecoration(
                                    hintText: 'Item',
                                    border: OutlineInputBorder()),
                                controller: listcontroller[index],
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
                                'Qty',
                                style: GoogleFonts.poppins(
                                    color: const Color(primary)),
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                    hintText: 'Qty',
                                    border: OutlineInputBorder()),
                                controller: quantitycontroller[index],
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
                              quantitycontroller[index].clear();
                              quantitycontroller[index].dispose();
                              quantitycontroller.removeAt(index);
                              listcontroller[index].clear();
                              listcontroller[index].dispose();
                              listcontroller.removeAt(index);
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
                      directioncontroller.add(TextEditingController());
                    });
                  },
                  icon: const Icon(Icons.add))
            ],
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: directioncontroller.length,
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
                                decoration: InputDecoration(
                                    hintText: 'Step ${index + 1}',
                                    border: const OutlineInputBorder()),
                                controller: directioncontroller[index],
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
                              directioncontroller[index].clear();
                              directioncontroller[index].dispose();
                              directioncontroller.removeAt(index);
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
        ],
      ),
    );
  }
}
