import 'package:cook_book/const/colors.dart';
import 'package:cook_book/db/dbfunction/ingredients_notifier.dart';
import 'package:cook_book/db/model/shoppinglist_model/shoppinglist_model.dart';
import 'package:flutter/material.dart';

class Getslist extends StatefulWidget {
  const Getslist({super.key});

  @override
  State<Getslist> createState() => _GetslistState();
}

class _GetslistState extends State<Getslist> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: ingredientNotifier,
        builder: (BuildContext ctx, List<IngredientModel> ingredinetList,
            Widget? child) {
          return ListView.separated(
            itemBuilder: (ctx, index) {
              final data = ingredinetList[index];
              return ListTile(
                title: Text('Ingredient: ${data.name}'),
                subtitle: Text('Quantity: ${data.quantity}'),
                trailing: IconButton(
                    onPressed: () {
                      deleteIngredient(data.name);
                    },
                    icon: const Icon(
                      Icons.check_box,
                      color: Colors.green,
                    )),
              );
            },
            separatorBuilder: (ctx, index) {
              return const Divider();
            },
            itemCount: ingredinetList.length,
          );
        });
  }
}
