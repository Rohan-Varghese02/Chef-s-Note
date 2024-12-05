import 'package:cook_book/db/model/data_model/category.dart';
import 'package:cook_book/db/model/data_model/meal.dart';

const availableCategories = [
  Categories(
      id: 'c1',
      title: 'Quick Meals',
      profilePic: 'assets/images/Quickmeal.png',
      width: 200,
      height: 120),
  Categories(
      id: 'c2',
      title: 'Italian',
      profilePic: 'assets/images/Italian.png',
      width: 110,
      height: 82),
  Categories(
    id: 'c3',
    title: 'Chinese',
    profilePic: 'assets/images/Chinese.png',
    width: 110,
    height: 82,
  ),
  Categories(
    id: 'c4',
    title: 'Indian',
    profilePic: 'assets/images/Indian.png',
    width: 110,
    height: 82,
  )
];

const dummyMeals = [
  Meal(
    rating: '4.3',
    id: 'm1',
    categories: [
      'c2',
      'rec',
    ],
    title: 'Spaghetti with Tomato Sauce',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
    duration: 20, // Total time in minutes
    ingredients: [
      'Tomatoes',
      'Olive Oil',
      'Onion',
      'Spaghetti',
      'Spices',
      'Cheese'
    ],
    qty: [
      '400g', // 4 tomatoes, assuming an average tomato weighs ~100g.
      '15ml', // 1 tablespoon = 15ml.
      '150g', // 1 medium onion weighs ~150g.
      '250g', // Spaghetti remains as-is in grams.
      '20g', // Spices generally measured by preference.
      '40g' // 1-2 slices of cheese, depending on slice thickness.
    ],
    steps: [
      '1. Cut the tomatoes and the onion into small pieces.',
      '2. Boil some water - add salt to it once it boils.',
      '3. Put the spaghetti into the boiling water - they should be done in about 10 to 12 minutes.',
      '4. In the meantime, heat up some olive oil and add the cut onion.',
      '5. After 2 minutes, add the tomato pieces, salt, pepper, and your other spices.',
      '6. The sauce will be done once the spaghetti are.',
      '7. Feel free to add some cheese on top of the finished dish.'
    ],
    isGlutenFree: false,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
    timer: [
      0, // No timer for cutting the tomatoes and onion.
      0, // No timer for boiling water (depends on your stove and amount of water).
      600, // Spaghetti should cook for 10 minutes (10 minutes = 600 seconds).
      120, // Heat up olive oil and cook onion for 2 minutes (120 seconds).
      120, // Simmer tomato sauce for 2 minutes (120 seconds).
      0, // No timer for sauce completion, as it depends on spaghetti readiness.
      0, // No timer for adding cheese; this is a finishing touch.
    ],
  ),
  Meal(
    rating: '4.7',
    id: 'm2',
    categories: ['c1', 'rec'],
    title: 'Toast Hawaii',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl:
        'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
    duration: 10, // Total time in minutes
    ingredients: [
      'white bread',
      'Cooked ham ',
      'Canned pineapple ',
      'Cheese',
      'Butter'
    ],
    qty: [
      '30g', // Bread
      '25g', // Ham
      '50g', // Pineapple
      '40g', // Cheese
      '5g', // Butter
    ],
    steps: [
      '1. Preheat your oven to 200°C (400°F). Set it to the bake function with the rack in the middle position.',
      '2. Take one slice of white bread and spread a thin, even layer of butter on one side.',
      '3. Place the buttered side of the bread facing up on a baking tray lined with parchment paper.',
      '4. Lay a slice of cooked ham evenly over the buttered bread, ensuring it covers the slice from edge to edge.',
      '5. Place a slice of canned pineapple directly on top of the ham. Pat the pineapple dry with a paper towel beforehand to avoid excess moisture.',
      '6. Add two slices of cheese over the pineapple, covering it entirely. You can use Emmental, Gouda, or a similar cheese that melts well.',
      '7. Transfer the baking tray into the preheated oven.',
      '8. Bake the toast for approximately 10 minutes, or until the cheese is melted and slightly golden.',
      '9. Carefully remove the tray from the oven using oven mitts.',
      '10. Let the toast cool slightly before serving.'
    ],
    timer: [
      0, // Preheating the oven doesn't require a timer.
      0, // Spreading butter doesn't require a timer.
      0, // Placing the bread on the tray doesn't require a timer.
      0, // Adding ham doesn't require a timer.
      0, // Adding pineapple doesn't require a timer.
      0, // Adding cheese doesn't require a timer.
      0, // Transferring the tray into the oven doesn't require a timer.
      600, // Baking for 10 minutes (600 seconds).
      0, // Removing the tray doesn't require a timer.
      0, // Cooling the toast doesn't require a timer.
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),

  Meal(
    rating: '3.8',
    id: 'm5',
    categories: ['c1'],
    title: 'Salad with Smoked Salmon',
    affordability: Affordability.luxurious,
    complexity: Complexity.simple,
    imageUrl:
        'https://cdn.pixabay.com/photo/2016/10/25/13/29/smoked-salmon-salad-1768890_1280.jpg',
    duration: 15, // Total time in minutes
    ingredients: [
      'Fresh arugula ',
      'Lamb\'s lettuce ',
      'Fresh parsley leaves',
      'Fennel bulbs',
      'Smoked salmon',
      'Mustard',
      'Balsamic vinegar',
      'Olive oil',
      'Salt',
      'Black pepper'
    ],
    qty: [
      '30g', // Arugula
      '30g', // Lamb's lettuce
      '10g', // Parsley
      '150g', // Fennel
      '200g', // Smoked salmon
      '60ml', // Mustard
      '120ml', // Balsamic vinegar
      '45ml', // Olive oil
      '2g', // Salt
      '2g', // Ground black pepper
    ],
    steps: [
      '1. Wash the arugula, lamb\'s lettuce, parsley, and fennel thoroughly under running water. Pat them dry with a clean towel or paper towel.',
      '2. Slice the fennel bulbs thinly using a knife or mandoline slicer. Set aside.',
      '3. Arrange the arugula, lamb\'s lettuce, parsley, and sliced fennel on a large serving plate or in a salad bowl.',
      '4. Dice the smoked salmon into small cubes, roughly 1cm in size, and evenly distribute them over the salad greens.',
      '5. In a small bowl, whisk together the mustard and balsamic vinegar until well combined. Gradually add olive oil while whisking to create a smooth dressing.',
      '6. Taste the dressing and season with salt and pepper as needed.',
      '7. Drizzle the dressing evenly over the salad, ensuring all the greens and salmon are lightly coated.',
      '8. Toss the salad gently before serving to combine the ingredients and dressing thoroughly.',
      '9. Serve the salad immediately as a fresh, luxurious appetizer or light meal.'
    ],
    timer: [
      0, // Washing and drying salad greens and herbs doesn't require a timer.
      0, // Slicing fennel doesn't require a timer.
      0, // Arranging the salad doesn't require a timer.
      0, // Dicing the smoked salmon doesn't require a timer.
      120, // Mixing the dressing takes about 2 minutes.
      0, // Tasting and seasoning the dressing doesn't require a timer.
      0, // Drizzling the dressing doesn't require a timer.
      60, // Tossing the salad gently takes about 1 minute.
      0, // Serving the salad doesn't require a timer.
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
// //////////////////////////////////////// INDIAN/////////////////////////////////////////////////
  Meal(
    rating: '4.5',
    id: 'm21',
    categories: ['c4', 'rec'],
    title: 'Butter Chicken',
    affordability: Affordability.pricey,
    complexity: Complexity.challenging,
    imageUrl:
        'https://images.immediate.co.uk/production/volatile/sites/30/2021/02/butter-chicken-ac2ff98.jpg?quality=90&resize=440,400',
    duration: 40, // Total time in minutes
    ingredients: [
      'Chicken',
      'Yogurt',
      'Butter',
      'Tomato Puree',
      'Onion',
      'Garlic',
      'Ginger',
      'Cream',
      'Cumin',
      'Coriander',
      'Garam Masala',
      'Turmeric',
      'Chili Powder',
      'Salt'
    ],
    qty: [
      '500g', // Chicken
      '120ml', // Yogurt
      '15g', // Butter
      '100ml', // Tomato puree
      '150g', // Onion
      '15g', // Garlic
      '10g', // Ginger
      '120ml', // Cream
      '5g', // Cumin powder
      '10g', // Coriander powder
      '15g', // Garam masala
      '25g', // Turmeric powder
      '10g', // Chili powder
      '5g', // Salt
    ],
    steps: [
      '1. In a mixing bowl, combine the chicken, yogurt, 10g turmeric powder, 5g chili powder, and 5g salt. Mix well, cover, and marinate for 1 hour.',
      '2. Heat butter in a large pan over medium heat. Add the chopped onions, garlic, and grated ginger. Sauté for 5-7 minutes until golden brown.',
      '3. Stir in the tomato puree, cumin, coriander, garam masala, and the remaining turmeric and chili powder. Cook for 5 minutes, or until the oil separates.',
      '4. Add the marinated chicken to the pan. Stir well and cook for 15-20 minutes, stirring occasionally, until the chicken is tender and fully cooked.',
      '5. Lower the heat and pour in the fresh cream. Simmer for 3-5 minutes to allow the flavors to blend.',
      '6. Serve hot with naan or steamed basmati rice. Garnish with a swirl of cream and fresh cilantro, if desired.'
    ],
    timer: [
      3600, // Marination time: 1 hour
      420, // Sautéing onions, garlic, and ginger: 7 minutes
      300, // Cooking tomato puree and spices: 5 minutes
      1200, // Cooking chicken: 20 minutes
      300, // Simmering with cream: 5 minutes
      0 // Serving doesn't require a timer
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),
  Meal(
    rating: '4.8',
    id: 'm22',
    categories: [
      'c4',
    ],
    title: 'Palak Paneer',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXmW5957i0DRg1p3raZP_hj6xa4dgd2Hye_A&s',
    duration: 30,
    ingredients: [
      'Paneer',
      'Spinach',
      'Onion',
      'Garlic',
      'Ginger',
      'Green Chilies',
      'Cream',
      'Cumin Seeds',
      'Coriander Powder',
      'Garam Masala',
      'Turmeric Powder',
      'Salt',
      'Oil'
    ],
    qty: [
      '200g', // Paneer
      '250g', // Spinach
      '150g', // Onion (~1 medium onion)
      '15g', // Garlic (~3 cloves)
      '10g', // Ginger (~1 inch piece)
      '10g', // Green chilies (~2 medium)
      '50ml', // Cream
      '5g', // Cumin seeds
      '10g', // Coriander powder
      '10g', // Garam masala
      '5g', // Turmeric powder
      '5g', // Salt (or to taste)
      '15ml' // Oil (~1 tablespoon)
    ],
    steps: [
      '1. Wash the spinach thoroughly and blanch it in boiling water for 2 minutes. Drain and transfer it to ice water immediately to retain its green color. Blend the spinach into a smooth puree.',
      '2. Heat oil in a pan over medium heat. Add cumin seeds and let them splutter.',
      '3. Add finely chopped onions and sauté until golden brown. Stir in minced garlic, grated ginger, and chopped green chilies. Cook for 2-3 minutes.',
      '4. Add coriander powder, turmeric powder, and garam masala. Cook for 2 minutes, stirring continuously to avoid burning the spices.',
      '5. Pour in the spinach puree and mix well. Let it cook for 5 minutes, stirring occasionally.',
      '6. Add paneer cubes and fresh cream to the pan. Stir gently to coat the paneer with the spinach gravy. Simmer for another 5 minutes.',
      '7. Add salt as needed and mix well. Remove from heat.',
      '8. Serve hot with roti, naan, or rice. Garnish with a drizzle of cream if desired.'
    ],
    timer: [
      120, // Blanching spinach: 2 minutes
      0, // Transferring spinach to ice water (no active time)
      300, // Sautéing onions, garlic, ginger, and chilies: 5 minutes
      120, // Cooking spices: 2 minutes
      300, // Cooking spinach puree: 5 minutes
      300, // Simmering with paneer and cream: 5 minutes
      0, // Final adjustments and serving
      0 // Serving (no active time)
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  Meal(
    rating: '4.6',
    id: 'm23',
    categories: ['c4', 'rec'],
    title: 'Masala Dosa',
    affordability: Affordability.affordable,
    complexity: Complexity.challenging,
    imageUrl: 'https://i.ytimg.com/vi/CCab5oh0ZOc/maxresdefault.jpg',
    duration: 45,
    ingredients: [
      'Dosa Batter',
      'Potatoes',
      'Onion',
      'Green Chilies',
      'Curry Leaves',
      'Mustard Seeds',
      'Turmeric Powder',
      'Oil'
    ],
    qty: [
      '300g', // Dosa Batter (equivalent to 2 cups)
      '450g', // Potatoes (3 medium-sized potatoes, approx 150g each)
      '150g', // Onion (1 large onion, approx 150g)
      '10g', // Green Chilies (2 medium chilies, approx 5g each)
      '5g', // Curry Leaves (approx 10 leaves)
      '5g', // Mustard Seeds
      '10g', // Turmeric Powder
      '100ml' // Oil
    ],
    steps: [
      '1. Boil the potatoes in a pressure cooker or pot until soft. Peel and mash them. Set aside.',
      '2. Heat oil in a pan over medium heat. Add mustard seeds and allow them to splutter. Then add curry leaves and chopped green chilies. Sauté for a minute.',
      '3. Add finely chopped onions and sauté until they turn golden brown.',
      '4. Add turmeric powder and the mashed potatoes to the pan. Cook for 2 minutes, stirring occasionally to ensure the mixture is well combined.',
      '5. Heat a non-stick or cast iron pan. Pour a ladle of dosa batter onto the hot pan and spread it evenly into a thin round shape. Drizzle some oil around the edges and cook for 2-3 minutes until the dosa turns golden and crispy.',
      '6. Place a portion of the potato filling in the center of the dosa. Fold the dosa over the filling to form a roll.',
      '7. Serve the Masala Dosa hot with chutney and sambar.'
    ],
    timer: [
      1200, // Boiling potatoes (about 20 minutes)
      0, // No active time for mashing potatoes
      120, // Heating oil and tempering mustard seeds and curry leaves (2 minutes)
      120, // Sautéing onions (2 minutes)
      120, // Cooking potatoes with turmeric (2 minutes)
      0, // Cooking the dosa (active time varies per dosa)
      0 // Serving (no active time)
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Meal(
    rating: '4.7',
    id: 'm24',
    categories: ['c4'],
    title: 'Chicken Biryani',
    affordability: Affordability.pricey,
    complexity: Complexity.hard,
    imageUrl:
        'https://maharajaroyaldining.com/wp-content/uploads/2024/04/Chicken-Dum-Biryani-3.webp',
    duration: 60,
    ingredients: [
      'Chicken',
      'Basmati Rice',
      'Yogurt',
      'Onions',
      'Tomatoes',
      'Ginger-Garlic Paste',
      'Biryani Masala',
      'Cardamom',
      'Cloves',
      'Bay Leaf',
      'Cinnamon',
      'Saffron',
      'Ghee'
    ],
    qty: [
      '500g', // Chicken
      '250g', // Basmati Rice
      '120ml', // Yogurt
      '300g', // Onions (approximately 3 medium onions)
      '300g', // Tomatoes (approximately 2 medium tomatoes)
      '20g', // Ginger-Garlic Paste (approx. 1 tablespoon)
      '20g', // Biryani Masala
      '5g', // Cardamom (approx. 5-6 pods)
      '2g', // Cloves (approx. 2 cloves)
      '1g', // Bay Leaf (approx. 1 leaf)
      '2g', // Cinnamon (approx. 2 small sticks or a pinch of ground cinnamon)
      '0.5g', // Saffron (a pinch)
      '20ml' // Ghee
    ],
    steps: [
      '1. Marinate the chicken with yogurt, biryani masala, cardamom, cloves, bay leaf, cinnamon, and salt for 2 hours.',
      '2. Cook rice with whole spices (cardamom, cloves, bay leaf, cinnamon) until 70% done (about 10-12 minutes). Drain the rice and set it aside.',
      '3. Fry onions until golden brown, then add ginger-garlic paste and tomatoes. Cook until the tomatoes are soft.',
      '4. Layer marinated chicken, fried onions, and rice in a large pot or pressure cooker.',
      '5. Add saffron milk (mix saffron in warm water or milk) and ghee over the top. Seal the pot and cook on low heat for 30 minutes to allow the flavors to meld.',
      '6. Serve hot with raita or a side salad.'
    ],
    timer: [
      0, // Marinate chicken for 2 hours
      720, // Cook rice (70% done) for 12 minutes
      300, // Fry onions and cook ginger-garlic paste and tomatoes (5 minutes)
      0, // Layering (no active time)
      1800, // Dum cooking (low heat) for 30 minutes
      0 // Serving (no active time)
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),
  Meal(
    rating: '4.4',
    id: 'm25',
    categories: ['c4'],
    title: 'Rajma Masala',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl:
        'https://www.cubesnjuliennes.com/wp-content/uploads/2020/06/Authentic-Punjabi-Rajma-Recipe.jpg',
    duration: 50,
    ingredients: [
      'Kidney Beans',
      'Onion',
      'Tomato Puree',
      'Garlic',
      'Ginger',
      'Green Chilies',
      'Cumin',
      'Coriander Powder',
      'Turmeric',
      'Chili Powder',
      'Garam Masala',
      'Oil',
      'Coriander Leaves'
    ],
    qty: [
      '200g', // Kidney Beans (1 cup)
      '150g', // Onion (approx. 1 medium onion)
      '240g', // Tomato Puree (approx. 1 cup)
      '9g', // Garlic (approx. 3 cloves)
      '5g', // Ginger (approx. 1 inch)
      '10g', // Green Chilies (approx. 2 medium chilies)
      '5g', // Cumin
      '5g', // Coriander Powder
      '2g', // Turmeric
      '5g', // Chili Powder
      '5g', // Garam Masala
      '30ml', // Oil (approx. 2 tbsp)
      '10g' // Coriander Leaves (for garnish)
    ],
    steps: [
      '1. Soak and boil the kidney beans until soft (approximately 30 minutes).',
      '2. Heat oil in a pan, sauté cumin, onions, garlic, ginger, and green chilies until golden brown.',
      '3. Add tomato puree, turmeric, coriander powder, chili powder, garam masala, and cook until the oil separates from the masala.',
      '4. Add boiled kidney beans and simmer for 20 minutes to allow the flavors to meld.',
      '5. Garnish with fresh coriander leaves and serve hot with rice.'
    ],
    timer: [
      1800, // Soak and boil kidney beans (30 minutes)
      300, // Sauté onions and spices (5 minutes)
      600, // Cook tomato puree and spices (10 minutes)
      1200, // Simmer beans with masala (20 minutes)
      0 // Garnishing (no active time)
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),

  Meal(
    rating: '4.6',
    id: 'm26',
    categories: ['c4'],
    title: 'Aloo Gobi',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl:
        'https://www.seriouseats.com/thmb/gTVjyFHq-N3iyv08113cBQWCTv8=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/20220303-aloo-gobi-vicky-wasik-35-c9afccd574534761886e5964f34586e1.jpg',
    duration: 30,
    ingredients: [
      'Potatoes',
      'Cauliflower',
      'Onion',
      'Tomato',
      'Garlic',
      'Ginger',
      'Cumin',
      'Coriander Powder',
      'Turmeric',
      'Chili Powder',
      'Garam Masala',
      'Oil',
      'Coriander Leaves'
    ],
    qty: [
      '300g', // Potatoes (approx. 2 medium potatoes)
      '250g', // Cauliflower (approx. 1 small head)
      '150g', // Onion (approx. 1 medium onion)
      '200g', // Tomato (approx. 1 medium tomato)
      '9g', // Garlic (approx. 3 cloves)
      '5g', // Ginger (approx. 1 inch)
      '5g', // Cumin
      '5g', // Coriander Powder
      '2g', // Turmeric
      '5g', // Chili Powder
      '5g', // Garam Masala
      '30ml', // Oil (approx. 2 tbsp)
      '10g' // Coriander Leaves (for garnish)
    ],
    steps: [
      '1. Heat oil in a pan, add cumin seeds, garlic, and ginger, and sauté until fragrant.',
      '2. Add chopped onions, tomatoes, coriander powder, turmeric, chili powder, and garam masala. Cook until oil separates from the masala.',
      '3. Add diced potatoes and cauliflower florets to the pan. Mix well with the spices.',
      '4. Cover the pan and cook until the vegetables are tender, stirring occasionally.',
      '5. Garnish with chopped coriander leaves and serve hot with roti or rice.'
    ],
    timer: [
      180, // Sauté cumin, garlic, and ginger (3 minutes)
      600, // Cook onions, tomatoes, and spices (10 minutes)
      600, // Cook potatoes and cauliflower (10 minutes)
      0, // Garnishing (no active time)
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Meal(
    rating: '4.3',
    id: 'm27',
    categories: ['c4'],
    title: 'Chole Bhature',
    affordability: Affordability.affordable,
    complexity: Complexity.challenging,
    imageUrl:
        'https://media.vogue.in/wp-content/uploads/2020/08/chole-bhature-recipe.jpg',
    duration: 50,
    ingredients: [
      'Chickpeas',
      'Onion',
      'Tomato',
      'Ginger-Garlic Paste',
      'Cumin',
      'Coriander Powder',
      'Chili Powder',
      'Garam Masala',
      'Turmeric',
      'Flour',
      'Yogurt',
      'Oil'
    ],
    qty: [
      '200g', // Chickpeas (approx. 1 cup)
      '200g', // Onion (approx. 2 medium onions)
      '300g', // Tomato (approx. 2 medium tomatoes)
      '15g', // Ginger-Garlic Paste (approx. 1 tbsp)
      '5g', // Cumin
      '5g', // Coriander Powder
      '5g', // Chili Powder
      '5g', // Garam Masala
      '2g', // Turmeric
      '250g', // Flour (approx. 2 cups)
      '60g', // Yogurt (approx. 1/4 cup)
      '30ml' // Oil (for frying, approx. 2 tbsp)
    ],
    steps: [
      '1. Soak chickpeas overnight and cook them until soft.',
      '2. Heat oil in a pan and sauté onions, ginger-garlic paste, and tomatoes with cumin, coriander powder, chili powder, garam masala, and turmeric until the oil separates.',
      '3. Add the boiled chickpeas, mix well, and cook for 10 minutes to blend the flavors.',
      '4. In a separate bowl, prepare the dough by mixing flour, yogurt, and enough water to form a soft dough.',
      '5. Roll out small portions of the dough into circles and fry them in hot oil until they puff up and turn golden brown.',
      '6. Serve the hot bhature with the chole.'
    ],
    timer: [
      0, // Soaking chickpeas (no active time)
      0, // Cooking chole (10 minutes)
      600, // Making dough (no active time)
      0, // Frying bhature (10 minutes)
      0 // No active time for serving
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),

  Meal(
    rating: '4.5',
    id: 'm28',
    categories: ['c4'],
    title: 'Daal Tadka',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl:
        'https://www.mrishtanna.com/wp-content/uploads/2019/10/dal-tadka-instant-pot.jpg',
    duration: 25,
    ingredients: [
      'Lentils',
      'Tomato',
      'Onion',
      'Garlic',
      'Ginger',
      'Cumin',
      'Mustard Seeds',
      'Chili Powder',
      'Turmeric',
      'Ghee',
      'Coriander Leaves'
    ],
    qty: [
      '200g', // Lentils (1 cup)
      '150g', // Tomato (1 medium)
      '150g', // Onion (1 medium)
      '9g', // Garlic (3 cloves)
      '5g', // Ginger (1-inch piece)
      '5g', // Cumin
      '5g', // Mustard Seeds
      '5g', // Chili Powder
      '5g', // Turmeric
      '15g', // Ghee (1 tbsp)
      'for garnish' // Coriander Leaves (to taste)
    ],
    steps: [
      '1. Cook lentils until soft and mash slightly.',
      '2. Heat ghee, temper with cumin, mustard seeds, garlic, and spices.',
      '3. Add tomatoes and onions, cook until soft.',
      '4. Mix with cooked lentils and simmer for 5 minutes.',
      '5. Garnish with coriander leaves and serve hot with rice or roti.'
    ],
    timer: [
      0, // Cooking lentils (no active time)
      600, // Cooking tadka (10 minutes)
      300, // Mixing and simmering (5 minutes)
      0 // No active time for garnishing
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),

  Meal(
    rating: '4.8',
    id: 'm29',
    categories: ['c4'],
    title: 'Paneer Tikka',
    affordability: Affordability.affordable,
    complexity: Complexity.challenging,
    imageUrl:
        'https://spicecravings.com/wp-content/uploads/2020/10/Paneer-Tikka-Featured-1.jpg',
    duration: 30,
    ingredients: [
      'Paneer',
      'Yogurt',
      'Bell Pepper',
      'Onion',
      'Ginger-Garlic Paste',
      'Cumin',
      'Coriander Powder',
      'Chili Powder',
      'Garam Masala',
      'Lemon Juice',
      'Oil'
    ],
    qty: [
      '200g', // Paneer
      '120g', // Yogurt (1/2 cup)
      '150g', // Bell Pepper (1 medium)
      '150g', // Onion (1 medium)
      '15g', // Ginger-Garlic Paste (1 tbsp)
      '5g', // Cumin
      '5g', // Coriander Powder
      '5g', // Chili Powder
      '5g', // Garam Masala
      '15ml', // Lemon Juice (1 tbsp)
      '15ml' // Oil (for brushing)
    ],
    steps: [
      '1. Marinate paneer and vegetables with yogurt, spices, and lemon juice.',
      '2. Skewer paneer and vegetables alternately.',
      '3. Grill or bake until golden, brushing with oil as needed.',
      '4. Serve hot with mint chutney.'
    ],
    timer: [
      0, // Marinating time (no active time)
      600, // Grilling/Baking (10 minutes)
      0 // No active time for serving
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
// /////////////////// Italian///////////////////////
  Meal(
    rating: '4.8',
    id: 'm10',
    categories: ['c2'],
    title: 'Margherita Pizza',
    affordability: Affordability.affordable,
    complexity: Complexity.challenging,
    imageUrl:
        'https://i0.wp.com/saturdayswithfrank.com/wp-content/uploads/marg-pizza-new-1.jpg?resize=1200%2C901&ssl=1',
    duration: 30,
    ingredients: [
      'Pizza Dough',
      'Tomato Sauce',
      'Fresh Mozzarella',
      'Basil Leaves',
      'Olive Oil'
    ],
    qty: [
      '200g', // Pizza Dough (1 ball, approximately 200g)
      '120g', // Tomato Sauce (1/2 cup, approximately 120g)
      '200g', // Fresh Mozzarella
      '10g', // Basil Leaves (approximately 8-10 leaves)
      '15ml' // Olive Oil (1 tbsp)
    ],
    steps: [
      'Preheat oven to the highest temperature.',
      'Roll out the pizza dough to a thin crust.',
      'Spread tomato sauce evenly on the dough.',
      'Add sliced mozzarella and basil leaves on top.',
      'Drizzle olive oil and bake for 10-12 minutes until crust is golden.',
      'Serve hot and enjoy!'
    ],
    timer: [
      300, // Preheating the oven (5 minutes = 300 seconds)
      300, // Rolling out dough (5 minutes = 300 seconds)
      0, // Spreading sauce (no active time)
      0, // Adding mozzarella (no active time)
      720, // Baking the pizza (12 minutes = 720 seconds)
      0 // Serving (no active time)
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),

  Meal(
    rating: '4.6',
    id: 'm11',
    categories: ['c2'],
    title: 'Spaghetti Carbonara',
    affordability: Affordability.affordable,
    complexity: Complexity.challenging,
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9dIBD96C9H9OT2FwzsAjssQcDhXTzOmreIw&s',
    duration: 25,
    ingredients: [
      'Spaghetti',
      'Eggs',
      'Pecorino Romano Cheese',
      'Guanciale',
      'Black Pepper'
    ],
    qty: [
      '250g', // Spaghetti
      '2', // Eggs
      '120g', // Pecorino Romano Cheese
      '100g', // Guanciale
      '25g' // Black Pepper
    ],
    steps: [
      'Cook spaghetti until al dente and save some pasta water.',
      'Fry guanciale until crispy in a pan.',
      'Whisk eggs and cheese together in a bowl.',
      'Mix spaghetti with guanciale, then add the egg mixture.',
      'Add pasta water to achieve creamy texture.',
      'Serve with extra cheese and black pepper.'
    ],
    timer: [
      600, // Cook spaghetti (10 minutes = 600 seconds)
      300, // Fry guanciale (5 minutes = 300 seconds)
      0, // Whisk eggs and cheese (no active time)
      0, // Mix spaghetti with guanciale (no active time)
      0, // Add pasta water (no active time)
      0 // Serve (no active time)
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),
  Meal(
    rating: '5',
    id: 'm12',
    categories: ['c2'],
    title: 'Risotto alla Milanese',
    affordability: Affordability.pricey,
    complexity: Complexity.hard,
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2xTukVFSvibIlJiUS41N2j_HCuLQ075xB5Q&s',
    duration: 40,
    ingredients: [
      'Arborio Rice',
      'Chicken Stock',
      'Onion',
      'Butter',
      'Saffron',
      'Parmesan Cheese',
      'White Wine'
    ],
    qty: [
      '200g', // Arborio Rice
      '1000ml', // Chicken Stock
      '1', // Onion
      '30g', // Butter
      'a pinch', // Saffron
      '30g', // Parmesan Cheese
      '60ml' // White Wine
    ],
    steps: [
      'Sauté onion in butter until translucent.',
      'Add rice and toast for 2 minutes.',
      'Deglaze with white wine and let it evaporate.',
      'Add hot chicken stock, one ladle at a time, stirring constantly.',
      'Mix saffron in the last ladle of stock and add to rice.',
      'Stir in parmesan cheese and butter for creaminess.',
      'Serve hot as a main dish.'
    ],
    timer: [
      300, // Sauté onion in butter (5 minutes = 300 seconds)
      120, // Toast rice (2 minutes = 120 seconds)
      90, // Deglaze with white wine (1.5 minutes = 90 seconds)
      900, // Add chicken stock and stir constantly (15 minutes = 900 seconds)
      0, // Mix saffron in the last ladle of stock (no active time)
      0, // Stir in parmesan cheese and butter (no active time)
      0 // Serve (no active time)
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),
  Meal(
    rating: '4.5',
    id: 'm13',
    categories: ['c2'],
    title: 'Lasagna Bolognese',
    affordability: Affordability.pricey,
    complexity: Complexity.hard,
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSF8CGRmcJd9zoDuGSm6Y8yPf18AYlUesFWaw&s',
    duration: 90, // 90 minutes in seconds
    ingredients: [
      'Lasagna Sheets', // 12 sheets
      'Bolognese Sauce', // 480g
      'Béchamel Sauce', // 480g
      'Parmesan Cheese', // 60g
      'Mozzarella Cheese' // 60g
    ],
    qty: [
      '12', // Lasagna Sheets
      '480g', // Bolognese Sauce
      '480g', // Béchamel Sauce
      '60g', // Parmesan Cheese
      '60g' // Mozzarella Cheese
    ],
    steps: [
      'Preheat oven to 180°C (350°F).',
      'Layer lasagna sheets with bolognese, béchamel, and cheeses in a baking dish.',
      'Repeat until ingredients are used, ending with béchamel and cheese.',
      'Bake for 40-45 minutes until golden and bubbly.',
      'Let it rest for 10 minutes before serving.'
    ],
    timer: [
      300, // Preheat oven (5 minutes)
      1200, // Layer ingredients (20 minutes)
      1200, // Repeat layers (20 minutes)
      2700, // Bake lasagna (45 minutes)
      600 // Let it rest (10 minutes)
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),

  Meal(
    rating: '4.3',
    id: 'm14',
    categories: ['c2'],
    title: 'Pesto Pasta',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl:
        'https://richanddelish.com/wp-content/uploads/2023/02/creamy-pesto-pasta-1.jpg',
    duration: 20, // 20 minutes in seconds
    ingredients: [
      'Pasta', // 250g
      'Basil Pesto', // 120g
      'Parmesan Cheese', // 30g
      'Olive Oil', // 15g
      'Pine Nuts' // 20g
    ],
    qty: [
      '250g', // Pasta
      '120g', // Basil Pesto
      '30g', // Parmesan Cheese
      '15g', // Olive Oil
      '20g' // Pine Nuts
    ],
    steps: [
      'Cook the pasta until al dente. Boil a large pot of salted water, add the pasta, and cook for 8-10 minutes or according to package instructions. Stir occasionally to prevent sticking.',
      'Drain the pasta, reserving 1/2 cup of pasta water to adjust the sauce consistency later.',
      'In a large bowl, combine the cooked pasta with basil pesto and olive oil. Toss the pasta well to coat evenly with the pesto sauce. You can add the reserved pasta water little by little to achieve your desired sauce consistency.',
      'Garnish the pasta with freshly grated parmesan cheese and toasted pine nuts. If desired, drizzle a little more olive oil on top for extra richness.',
      'Serve immediately while hot for the best flavor. Enjoy your creamy pesto pasta with a side of fresh salad or garlic bread!'
    ],
    timer: [
      600, // Cook pasta (10 minutes)
      120, // Drain pasta and reserve water (2 minutes)
      300, // Toss pasta with pesto (5 minutes)
      150, // Garnish with cheese and pine nuts (2.5 minutes)
      30 // Serve immediately (30 seconds)
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),

  Meal(
    rating: '4.9',
    id: 'm15',
    categories: ['c2'],
    title: 'Tiramisu',
    affordability: Affordability.pricey,
    complexity: Complexity.challenging,
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkt8t2u0Tfa3zHkKZRorSk0otjBTYA3WgNkg&s',
    duration: 30, // 30 minutes in seconds
    ingredients: [
      'Ladyfingers', // 20 pieces
      'Mascarpone Cheese', // 250g
      'Espresso', // 240ml (1 cup)
      'Cocoa Powder', // 2 tbsp
      'Sugar', // 50g (1/4 cup)
      'Eggs' // 2
    ],
    qty: [
      '20', // Ladyfingers
      '250g', // Mascarpone Cheese
      '240ml', // Espresso
      '30ml', // Cocoa Powder
      '50g', // Sugar
      '2' // Eggs
    ],
    steps: [
      'In a bowl, beat the egg yolks and sugar together until pale and creamy. This should take around 3-5 minutes using an electric mixer.',
      'Carefully fold in the mascarpone cheese into the egg and sugar mixture until smooth and fully combined. Be gentle to avoid deflating the mixture.',
      'Dip each ladyfinger quickly into the espresso and layer them at the bottom of a serving dish. Be careful not to soak them too much.',
      'Spread half of the mascarpone mixture on top of the ladyfingers. Repeat the process to form a second layer of dipped ladyfingers, followed by the remaining mascarpone mixture.',
      'Dust the top with cocoa powder and refrigerate for at least 4 hours (overnight is ideal) to allow the flavors to meld and the dessert to set.'
    ],
    timer: [
      300, // Beat egg yolks and sugar (5 minutes)
      150, // Fold in mascarpone (2.5 minutes)
      180, // Dip ladyfingers and layer (3 minutes)
      180, // Spread mascarpone mixture (3 minutes)
      1200 // Chill in the fridge (4 hours)
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),

  Meal(
    rating: '4.7',
    id: 'm16',
    categories: [
      'c1',
      'c2',
    ],
    title: 'Caprese Salad',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyoWFlSTaExJkm_-Q1sWGSi1YJUzeUDInyDA&s',
    duration: 10, // 10 minutes in seconds
    ingredients: [
      'Tomatoes', // 300g
      'Fresh Mozzarella', // 200g
      'Basil Leaves', // 10g (approx.)
      'Olive Oil', // 15ml
      'Balsamic Glaze' // 15ml
    ],
    qty: [
      '300g', // Tomatoes
      '200g', // Fresh Mozzarella
      '10g', // Basil Leaves
      '15ml', // Olive Oil
      '15ml' // Balsamic Glaze
    ],
    steps: [
      'Slice tomatoes and mozzarella into even rounds.',
      'Arrange the slices alternately with basil leaves on a plate.',
      'Drizzle olive oil and balsamic glaze over the salad.',
      'Serve fresh as a starter or side dish.'
    ],
    timer: [
      120, // Slice tomatoes and mozzarella (2 minutes)
      120, // Arrange slices and basil (2 minutes)
      60, // Drizzle olive oil and balsamic glaze (1 minute)
      300 // Serve fresh (5 minutes)
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),

  Meal(
    rating: '4.6',
    id: 'm17',
    categories: [
      'c2',
    ],
    title: 'Focaccia Bread',
    affordability: Affordability.pricey,
    complexity: Complexity.challenging,
    imageUrl:
        'https://amybakesbread.com/wp-content/uploads/2024/07/DSC_5963-886x1024.jpg',
    duration: 120, // 120 minutes in seconds
    ingredients: [
      'Flour', // 500g
      'Olive Oil', // 60ml
      'Yeast', // 10g
      'Salt', // 5g
      'Rosemary' // 10g
    ],
    qty: [
      '500g', // Flour
      '60ml', // Olive Oil
      '10g', // Yeast
      '5g', // Salt
      '10g' // Rosemary
    ],
    steps: [
      'Mix flour, yeast, salt, and water to form a dough.',
      'Knead until smooth, then let it rise for 1 hour.',
      'Press the dough into a baking sheet, add olive oil and rosemary.',
      'Bake at 200°C (400°F) for 20-25 minutes until golden.',
      'Cool and serve.'
    ],
    timer: [
      600, // Mix ingredients and form dough (10 minutes)
      3600, // Let the dough rise (1 hour)
      600, // Press dough and add olive oil & rosemary (10 minutes)
      1500, // Bake (20-25 minutes)
      600 // Cool and serve (10 minutes)
    ],
    isGlutenFree: false,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
//   ////////////////Chinese/////////////////////
  Meal(
    rating: '4.5',
    id: 'm28',
    categories: [
      'c3',
    ],
    title: 'Kung Pao Chicken',
    affordability: Affordability.affordable,
    complexity: Complexity.challenging,
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCLe13V4S98q2tYe3sGajFqiLuzW5wTizcmw&s',
    duration: 25, // 25 minutes in seconds
    ingredients: [
      'Chicken Breast', // 500g
      'Peanuts', // 30g
      'Dried Red Chilies', // 5-6 pieces (approx. 5g)
      'Garlic', // 6g (approx. 2 cloves)
      'Soy Sauce', // 45ml
      'Cornstarch', // 10g
      'Sugar' // 5g
    ],
    qty: [
      '500g', // Chicken Breast
      '30g', // Peanuts
      '5g', // Dried Red Chilies
      '6g', // Garlic (approx. 2 cloves)
      '45ml', // Soy Sauce
      '10g', // Cornstarch
      '5g' // Sugar
    ],
    steps: [
      'Dice the chicken into small pieces and marinate in soy sauce and cornstarch.',
      'Stir-fry peanuts in oil until golden brown, then set aside.',
      'Fry dried red chilies and minced garlic in oil until fragrant.',
      'Add marinated chicken and cook until golden brown and cooked through.',
      'Stir in the prepared sauce mixture, then add the peanuts. Cook until the sauce thickens.',
      'Serve hot with steamed rice.'
    ],
    timer: [
      600, // Marinate chicken (10 minutes)
      300, // Stir-fry peanuts (5 minutes)
      300, // Fry chilies and garlic (5 minutes)
      600, // Cook chicken (10 minutes)
      300, // Cook with sauce mixture and peanuts (5 minutes)
      0 // Serve (no extra time needed)
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Meal(
    rating: '4.7',
    id: 'm29',
    categories: [
      'c3',
    ],
    title: 'Sweet and Sour Pork',
    affordability: Affordability.affordable,
    complexity: Complexity.challenging,
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXjT-T6TKlJ81hUznoo3nDq9aGUTf-CN0hBA&s',
    duration: 30, // 30 minutes in seconds
    ingredients: [
      'Pork Belly', // 300g
      'Pineapple', // 120g (1/2 cup)
      'Bell Peppers', // 150g (1 bell pepper)
      'Vinegar', // 30ml (2 tbsp)
      'Ketchup', // 45ml (3 tbsp)
      'Sugar', // 15g (1 tbsp)
      'Cornstarch' // 20g (2 tbsp)
    ],
    qty: [
      '300g', // Pork Belly
      '120g', // Pineapple
      '150g', // Bell Peppers
      '30ml', // Vinegar
      '45ml', // Ketchup
      '15g', // Sugar
      '20g' // Cornstarch
    ],
    steps: [
      'Coat the pork belly pieces with cornstarch and fry them in hot oil until crispy.',
      'Stir-fry the bell peppers and pineapple chunks in oil until slightly tender.',
      'In a bowl, mix vinegar, ketchup, sugar, and cornstarch to create the sauce.',
      'Add the fried pork and sauce to the pan with bell peppers and pineapple.',
      'Cook everything together until the sauce thickens and coats the pork evenly.',
      'Serve hot with steamed rice.'
    ],
    timer: [
      600, // Coat and fry pork (10 minutes)
      300, // Stir-fry bell peppers and pineapple (5 minutes)
      300, // Mix sauce and cook (5 minutes)
      600, // Cook everything until sauce thickens (10 minutes)
      0 // Serve (no extra time needed)
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Meal(
    rating: '4.8',
    id: 'm30',
    categories: [
      'c3',
    ],
    title: 'Mapo Tofu',
    affordability: Affordability.affordable,
    complexity: Complexity.challenging,
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsmOKHZdZSq1J47qsLMJS3HQMnw2YMd_q-2g&s',
    duration: 20, // 20 minutes in seconds
    ingredients: [
      'Tofu', // 300g
      'Ground Pork', // 150g
      'Doubanjiang', // 15g (1 tbsp)
      'Garlic', // 6g (2 cloves)
      'Ginger', // 2g (1 tsp)
      'Soy Sauce', // 30ml (2 tbsp)
      'Sichuan Peppercorns' // 2g (1 tsp)
    ],
    qty: [
      '300g', // Tofu
      '150g', // Ground Pork
      '15g', // Doubanjiang (Chili Bean Paste)
      '6g', // Garlic (2 cloves)
      '2g', // Ginger (1 tsp)
      '30ml', // Soy Sauce
      '2g' // Sichuan Peppercorns
    ],
    steps: [
      'Fry garlic, ginger, and doubanjiang in oil until fragrant.',
      'Add ground pork and cook until browned.',
      'Add tofu and gently mix to avoid breaking.',
      'Add soy sauce and a bit of water, simmer for 5 minutes.',
      'Garnish with ground Sichuan peppercorns and serve hot.'
    ],
    timer: [
      300, // Fry garlic, ginger, and doubanjiang (5 minutes)
      300, // Cook ground pork (5 minutes)
      300, // Add tofu and mix (5 minutes)
      300, // Simmer with soy sauce (5 minutes)
      0 // Serve (no extra time)
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),

  Meal(
    rating: '4.4',
    id: 'm31',
    categories: [
      'c3',
    ],
    title: 'Spring Rolls',
    affordability: Affordability.affordable,
    complexity: Complexity.challenging,
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5K4hQhb5NRHsSp2S5QLa8ohlMvxZFmlrkzA&s',
    duration: 30, // 30 minutes in seconds
    ingredients: [
      'Spring Roll Wrappers', // 10 wrappers
      'Cabbage', // 80g (1 cup)
      'Carrot', // 50g (1/2 cup)
      'Mushrooms', // 30g (1/4 cup)
      'Soy Sauce', // 30ml (2 tbsp)
      'Oil' // as needed (approximately 50ml)
    ],
    qty: [
      '10', // Spring Roll Wrappers
      '80g', // Cabbage
      '50g', // Carrot
      '30g', // Mushrooms
      '30ml', // Soy Sauce
      '50ml' // Oil (for frying)
    ],
    steps: [
      'Shred vegetables and stir-fry with soy sauce until tender.',
      'Place filling on wrappers and roll tightly.',
      'Seal edges with water.',
      'Fry in hot oil until golden and crispy.',
      'Serve with dipping sauce.'
    ],
    timer: [
      600, // Shred vegetables and stir-fry (10 minutes)
      300, // Fill and roll wrappers (5 minutes)
      300, // Seal edges with water (5 minutes)
      600, // Fry until golden and crispy (10 minutes)
      0 // Serve with dipping sauce (no extra time)
    ],
    isGlutenFree: false,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),

  Meal(
    rating: '4.6',
    id: 'm32',
    categories: ['c3', 'c1'],
    title: 'Hot and Sour Soup',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkMTiUJHpTtrarKEU0kbkTt16j1PEN-BQsNA&s',
    duration: 25, // 25 minutes in seconds
    ingredients: [
      'Mushrooms', // 80g (1 cup)
      'Tofu', // 100g
      'Vinegar', // 30ml (2 tbsp)
      'Soy Sauce', // 30ml (2 tbsp)
      'Egg', // 1 large
      'Cornstarch', // 10g (1 tbsp)
      'White Pepper' // 1g (1 tsp)
    ],
    qty: [
      '80g', // Mushrooms
      '100g', // Tofu
      '30ml', // Vinegar
      '30ml', // Soy Sauce
      '1', // Egg
      '10g', // Cornstarch
      '1g' // White Pepper
    ],
    steps: [
      'Bring water to a boil and add mushrooms and tofu.',
      'Stir in vinegar, soy sauce, and white pepper.',
      'Mix cornstarch with water and add to thicken soup.',
      'Drizzle beaten egg slowly while stirring.',
      'Serve hot as an appetizer.'
    ],
    timer: [
      600, // Boil water and add mushrooms and tofu (10 minutes)
      300, // Stir in vinegar, soy sauce, and white pepper (5 minutes)
      300, // Mix cornstarch and add (5 minutes)
      300, // Drizzle egg slowly while stirring (5 minutes)
      0 // Serve hot as an appetizer (no extra time)
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Meal(
    rating: '4.7',
    id: 'm33',
    categories: ['c3'],
    title: 'Beef Chow Fun',
    affordability: Affordability.affordable,
    complexity: Complexity.challenging,
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQB94D6M6fGzZEYvAEIvoBCa4gJgDeXfHKNpg&s',
    duration: 30, // 30 minutes in seconds
    ingredients: [
      'Flat Rice Noodles', // 300g
      'Beef Slices', // 200g
      'Soy Sauce', // 30ml (2 tbsp)
      'Bean Sprouts', // 100g (1 cup)
      'Garlic', // 6g (2 cloves)
      'Oyster Sauce' // 15ml (1 tbsp)
    ],
    qty: [
      '300g', // Flat Rice Noodles
      '200g', // Beef Slices
      '30ml', // Soy Sauce
      '100g', // Bean Sprouts
      '6g', // Garlic
      '15ml' // Oyster Sauce
    ],
    steps: [
      'Stir-fry beef until browned and set aside.',
      'Fry garlic and noodles until slightly charred.',
      'Add soy sauce, oyster sauce, and bean sprouts.',
      'Mix in beef and cook for 2 minutes.',
      'Serve hot and enjoy!'
    ],
    timer: [
      600, // Stir-fry beef (10 minutes)
      600, // Fry garlic and noodles (10 minutes)
      300, // Add sauces and bean sprouts (5 minutes)
      120, // Mix in beef and cook (2 minutes)
      0 // Serve hot (no extra time)
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Meal(
    rating: '4.8',
    id: 'm34',
    categories: ['c3'],
    title: 'Dim Sum Dumplings',
    affordability: Affordability.affordable,
    complexity: Complexity.hard,
    imageUrl:
        'https://allwaysdelicious.com/wp-content/uploads/2021/01/har-gow-sq-1.jpg',
    duration: 40, // 40 minutes in seconds
    ingredients: [
      'Dumpling Wrappers', // 20 pieces
      'Shrimp', // 150g
      'Pork', // 150g
      'Ginger', // 1 tsp (about 5g)
      'Soy Sauce', // 30ml (2 tbsp)
      'Sesame Oil' // 5ml (1 tsp)
    ],
    qty: [
      '20', // Dumpling Wrappers
      '150g', // Shrimp
      '150g', // Pork
      '5g', // Ginger (1 tsp)
      '30ml', // Soy Sauce (2 tbsp)
      '5ml' // Sesame Oil (1 tsp)
    ],
    steps: [
      'Mix shrimp, pork, ginger, soy sauce, and sesame oil into a filling.',
      'Place filling in wrappers and seal tightly.',
      'Steam dumplings for 10-12 minutes.',
      'Serve with soy dipping sauce.'
    ],
    timer: [
      600, // Mixing and filling (10 minutes)
      1200, // Steaming dumplings (10-12 minutes)
      0 // Serving (no extra time)
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
];
