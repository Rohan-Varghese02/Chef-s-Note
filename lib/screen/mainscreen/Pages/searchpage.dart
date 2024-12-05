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
  String _selectedRating = "0";
  int _maxTime = 60; // in minutes
  int _maxIngredients = 10;

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
        final matchesRating = meal.rating.compareTo(_selectedRating) >= 0;
        final matchesTime = meal.duration <= _maxTime;
        final matchesIngredients = meal.ingredients.length <= _maxIngredients;

        return matchesSearch &&
            matchesGlutenFree &&
            matchesLactoseFree &&
            matchesVegetarian &&
            matchesRating &&
            matchesTime &&
            matchesIngredients;
      }).toList();
    });
  }

  Widget _buildSlider({
    required String title,
    required double min,
    required double max,
    required double value,
    required String unit,
    required Function(double) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title: ${value.toStringAsFixed(0)} $unit',
            style:
                GoogleFonts.poppins(color: const Color(primary), fontSize: 17),
          ),
          Slider(
            activeColor: const Color(primary),
            inactiveColor: Colors.grey,
            min: min,
            max: max,
            value: value,
            divisions: (max - min).toInt(),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  Widget _buildFilterSwitch(
      String title, bool currentValue, Function(bool) updateValue) {
    return SwitchListTile(
      activeColor: const Color(primary),
      title: Text(
        title,
        style: GoogleFonts.poppins(color: const Color(primary), fontSize: 17),
      ),
      value: currentValue,
      onChanged: (value) {
        updateValue(value);
        _applyFilters();
      },
    );
  }

  Widget _buildRatingDropdown() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Minimum Rating',
                style: GoogleFonts.poppins(
                    color: const Color(primary), fontSize: 17),
              ),
              const SizedBox(
                width: 20,
              ),
              DropdownButton<String>(
                value: _selectedRating,
                items: ["0", "1.5", "2.5", "3.5", "4.5", "5"]
                    .map((rating) => DropdownMenuItem<String>(
                          value: rating,
                          child: Text(
                            '$rating ',
                            style: GoogleFonts.poppins(
                                color: const Color(primary)),
                          ),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedRating = value!;
                    _applyFilters();
                  });
                },
                dropdownColor: Colors.white,
                icon: const Icon(Icons.star, color: Color(primary)),
              ),
            ],
          ),
        ],
      ),
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
            Column(
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
                _buildRatingDropdown(),
                _buildSlider(
                  title: 'Maximum Cooking Time',
                  min: 10,
                  max: 120,
                  value: _maxTime.toDouble(),
                  unit: 'mins',
                  onChanged: (value) {
                    setState(() {
                      _maxTime = value.toInt();
                      _applyFilters();
                    });
                  },
                ),
                _buildSlider(
                  title: 'Maximum Ingredients',
                  min: 1,
                  max: 20,
                  value: _maxIngredients.toDouble(),
                  unit: '',
                  onChanged: (value) {
                    setState(() {
                      _maxIngredients = value.toInt();
                      _applyFilters();
                    });
                  },
                ),
              ],
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
                              color: Colors
                                  .white, // Background color of the container
                              borderRadius: BorderRadius.circular(
                                  10), // Optional: Rounded corners
                              boxShadow: [
                                BoxShadow(
                                  color: const Color.fromARGB(255, 77, 172, 167)
                                      .withOpacity(
                                          0.5), // Shadow color and opacity
                                  spreadRadius:
                                      2, // How much the shadow spreads
                                  blurRadius: 5, // How soft the shadow is
                                  offset: const Offset(2,
                                      3), // Horizontal and vertical shadow offsets
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
