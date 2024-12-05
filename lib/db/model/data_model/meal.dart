enum Complexity {
  simple,
  challenging,
  hard,
}

enum Affordability {
  affordable,
  pricey,
  luxurious,
}

class Meal {
  const Meal({
    required this.rating,
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.qty,
    required this.complexity,
    required this.affordability,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
  });
  final String rating;
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> qty;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

    // Convert Meal to JSON
  Map<String, dynamic> toJson() {
    return {
      'rating': rating,
      'id': id,
      'categories': categories,
      'title': title,
      'imageUrl': imageUrl,
      'ingredients': ingredients,
      'qty': qty,
      'steps': steps,
      'duration': duration,
      'complexity': complexity.index, // Save enum as index
      'affordability': affordability.index, // Save enum as index
      'isGlutenFree': isGlutenFree,
      'isLactoseFree': isLactoseFree,
      'isVegan': isVegan,
      'isVegetarian': isVegetarian,
    };
  }

  // Create Meal from JSON
  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      rating: json['rating'],
      id: json['id'],
      categories: List<String>.from(json['categories']),
      title: json['title'],
      imageUrl: json['imageUrl'],
      ingredients: List<String>.from(json['ingredients']),
      qty: List<String>.from(json['qty']),
      steps: List<String>.from(json['steps']),
      duration: json['duration'],
      complexity: Complexity.values[json['complexity']], // Convert index back to enum
      affordability: Affordability.values[json['affordability']], // Convert index back to enum
      isGlutenFree: json['isGlutenFree'],
      isLactoseFree: json['isLactoseFree'],
      isVegan: json['isVegan'],
      isVegetarian: json['isVegetarian'],
    );
  }
}




