import 'package:cook_book/const/colors.dart';
import 'package:cook_book/screen/mainscreen/Pages/createpagewidget/functions/recfunc.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:hive_flutter/hive_flutter.dart';

class Recipedetails extends StatefulWidget {
  GlobalKey<FormState> key_form;
  TextEditingController? name;
  List<TextEditingController> listcontroller = [TextEditingController()];
  List<TextEditingController> quantitycontroller = [TextEditingController()];
  List<TextEditingController> directioncontroller = [TextEditingController()];

  Recipedetails(
      {super.key,
      required this.name,
      required this.key_form,
      required this.listcontroller,
      required this.quantitycontroller,
      required this.directioncontroller});

  @override
  State<Recipedetails> createState() => _RecipedetailsState();
}

class _RecipedetailsState extends State<Recipedetails> {
  //final key_form = GlobalKey<FormState>();
  // List<TextEditingController> listcontroller = [TextEditingController()];
  // List<TextEditingController> quantitycontroller = [TextEditingController()];
  // List<TextEditingController> directioncontroller = [TextEditingController()];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.key_form,
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
        ],
      ),
    );
  }
}