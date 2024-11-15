String? recipdirectionvalidation(String? value, int index) {
  if (value == null || value.isEmpty) {
    return 'Direction ${index + 1} cannot be empty';
  } else {
    return null;
  }
}

String? recipeQtyvalidation(String? value) {
  if (value == null || value.isEmpty) {
    return 'Provide Qty';
  } else {
    return null;
  }
}

String? recipeingridientsvalidation(String? value) {
  if (value == null || value.isEmpty) {
    return 'Ingridients cannot be empty';
  } else {
    return null;
  }
}

String? recipeNameValidation(String? value) {
  if (value == null || value.isEmpty) {
    return 'Provide Name';
  } else {
    return null;
  }
}

String? recipeTimeValidation(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a number';
  }
  // Try to parse the input as an integer
  final int? number = int.tryParse(value);
  if (number == null) {
    return 'Please enter a valid time';
  }
  return null; // Input is valid
}

String? recipeRatingValidation(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a number';
  }
  // Try to parse the input as an integer
  final double? number = double.tryParse(value);
  if (number == null) {
    return 'Please enter a valid rating';
  } else if (number >= 5.00) {
    return 'Rating must be less than 5';
  }
  return null; // Input is valid
}
