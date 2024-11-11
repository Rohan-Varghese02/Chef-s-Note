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
