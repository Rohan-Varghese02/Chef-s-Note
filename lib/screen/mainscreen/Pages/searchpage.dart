import 'package:cook_book/const/colors.dart';
import 'package:cook_book/db/data/dummy_data.dart';
import 'package:cook_book/db/model/data_model/meal.dart';
import 'package:cook_book/screen/recipescreen/recipeStatic.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({super.key});

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  bool _showFilters = false;
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegetarian = false;
  String _searchQuery = '';
  List<Meal> _filteredMeals = dummyMeals;

  void _updateSearch(String query) {
    setState(() {
      _searchQuery = query;
      _filteredMeals = dummyMeals
          .where(
              (meal) => meal.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _applyFilters() {
    setState(() {
      _filteredMeals = dummyMeals.where((meal) {
        final matchesSearch =
            meal.title.toLowerCase().contains(_searchQuery.toLowerCase());
        final matchesGlutenFree = !_isGlutenFree || meal.isGlutenFree;
        final matchesLactoseFree = !_isLactoseFree || meal.isLactoseFree;
        final matchesVegetarian = !_isVegetarian || meal.isVegetarian;

        return matchesSearch &&
            matchesGlutenFree &&
            matchesLactoseFree &&
            matchesVegetarian;
      }).toList();
    });
  }

  Widget _buildFilterSwitch(
      String title, bool currentValue, Function(bool) updateValue) {
    return SwitchListTile(
      activeColor: const Color(primary),
      title: Text(
        title,
        style: GoogleFonts.poppins(color: const Color(primary)),
      ),
      value: currentValue,
      onChanged: (value) {
        updateValue(value);
        _applyFilters();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search',
          style: GoogleFonts.poppins(
              color: const Color(primary),
              fontWeight: FontWeight.bold,
              fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(
                  width: 345,
                  child: TextField(
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(primary),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      hintText: 'Search by title...',
                      hintStyle:
                          GoogleFonts.poppins(color: const Color(primary)),
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Color(primary),
                      ),
                    ),
                    onChanged: _updateSearch,
                  ),
                ),
                // Show/Hide Filters Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _showFilters = !_showFilters;
                        });
                      },
                      icon: Icon(
                        _showFilters
                            ? Icons.filter_list_off
                            : Icons.filter_list,
                        color: const Color(primary),
                      ),
                      // label: const SizedBox(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Filters Section
          if (_showFilters)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  _buildFilterSwitch('Gluten-Free', _isGlutenFree, (value) {
                    setState(() => _isGlutenFree = value);
                  }),
                  _buildFilterSwitch('Lactose-Free', _isLactoseFree, (value) {
                    setState(() => _isLactoseFree = value);
                  }),
                  _buildFilterSwitch('Vegetarian', _isVegetarian, (value) {
                    setState(() => _isVegetarian = value);
                  }),
                ],
              ),
            ),
          // Recipe List
          Expanded(
            child: _filteredMeals.isEmpty
                ? Center(
                    child: Text(
                    'No recipes found.',
                    style: GoogleFonts.poppins(color: const Color(primary)),
                  ))
                : ListView.builder(
                    itemCount: _filteredMeals.length,
                    itemBuilder: (ctx, index) {
                      final mealinfo = _filteredMeals[index];
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
                                border: Border.all(color: const Color(primary)),
                                borderRadius: BorderRadius.circular(15)),
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
                                  backgroundImage:
                                      NetworkImage(mealinfo.imageUrl),
                                ),
                                subtitle: Row(
                                  children: [
                                    const Icon(Icons.star,
                                        size: 20, color: Color(primary)),
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
                                    const Icon(Icons.timer,
                                        size: 20, color: Color(primary)),
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
                  ),
          ),
        ],
      ),
    );
  }
}
