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
    duration: 20,
    ingredients: [
      'Tomatoes',
      'Tablespoon of Olive Oil',
      'Onion',
      'Spaghetti',
      'Spices',
      'Cheese'
    ],
    qty: ['4', '1tbsp', '1', '250g', 'as required', '1-2 slice'],
    steps: [
      'Cut the tomatoes and the onion into small pieces.',
      'Boil some water - add salt to it once it boils.',
      'Put the spaghetti into the boiling water - they should be done in about 10 to 12 minutes.',
      'In the meantime, heaten up some olive oil and add the cut onion.',
      'After 2 minutes, add the tomato pieces, salt, pepper and your other spices.',
      'The sauce will be done once the spaghetti are.',
      'Feel free to add some cheese on top of the finished dish.'
    ],
    isGlutenFree: false,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
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
    duration: 10,
    ingredients: [
      'Slice White Bread',
      'Slice Ham',
      'Slice Pineapple',
      'Slices of Cheese',
      'Butter'
    ],
    qty: ['1', '1', '1', '1-2 Slice', '1tsp'],
    steps: [
      'Butter one side of the white bread',
      'Layer ham, the pineapple and cheese on the white bread',
      'Bake the toast for round about 10 minutes in the oven at 200°C'
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),
  // Meal(
  //   rating: '4.4',
  //   id: 'm3',
  //   categories: [
  //     'c1',
  //     // add american 'c3',
  //   ],
  //   title: 'Classic Hamburger',
  //   affordability: Affordability.pricey,
  //   complexity: Complexity.simple,
  //   imageUrl:
  //       'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',
  //   duration: 45,
  //   ingredients: [
  //     'Cattle Hack',
  //     'Tomato',
  //     'Cucumber',
  //     'Onion',
  //     'Ketchup',
  //     'Burger Buns'
  //   ],
  //   qty: ['300g', '1', '1', 'as required', '2'],
  //   steps: [
  //     'Form 2 patties',
  //     'Fry the patties for c. 4 minutes on each side',
  //     'Quickly fry the buns for c. 1 minute on each side',
  //     'Bruch buns with ketchup',
  //     'Serve burger with tomato, cucumber and onion'
  //   ],
  //   isGlutenFree: false,
  //   isVegan: false,
  //   isVegetarian: false,
  //   isLactoseFree: true,
  // ),
  Meal(
    rating: '3.8',
    id: 'm5',
    categories: ['c1'],
    title: 'Salad with Smoked Salmon',
    affordability: Affordability.luxurious,
    complexity: Complexity.simple,
    imageUrl:
        'https://cdn.pixabay.com/photo/2016/10/25/13/29/smoked-salmon-salad-1768890_1280.jpg',
    duration: 15,
    ingredients: [
      'Arugula',
      'Lamb\'s Lettuce',
      'Parsley',
      'Fennel',
      '200g Smoked Salmon',
      'Mustard',
      'Balsamic Vinegar',
      'Olive Oil',
      'Salt and Pepper'
    ],
    qty: ['1', '1', '1', '2', '200', '1/4 cup', '1/2 cup', 'Preffered'],
    steps: [
      'Wash and cut salad and herbs',
      'Dice the salmon',
      'Process mustard, vinegar and olive oil into a dessing',
      'Prepare the salad',
      'Add salmon cubes and dressing'
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
//////////////////////////////////////// INDIAN/////////////////////////////////////////////////
  Meal(
    rating: '4.5',
    id: 'm21',
    categories: [
      'c4',
    ],
    title: 'Butter Chicken',
    affordability: Affordability.pricey,
    complexity: Complexity.challenging,
    imageUrl:
        'https://images.immediate.co.uk/production/volatile/sites/30/2021/02/butter-chicken-ac2ff98.jpg?quality=90&resize=440,400',
    duration: 40,
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
    ],
    qty: [
      '500g',
      '1/2 cup',
      '3 tbsp',
      '1 cup',
      '1',
      '4 cloves',
      '1 inch',
      '1/2 cup',
      'as required',
      'as required',
      'as required',
      'as required',
      'as required',
    ],
    steps: [
      'Marinate the chicken with yogurt, turmeric, chili powder, and salt. Let it sit for 1 hour.',
      'Heat butter in a pan, sauté onions, garlic, and ginger until golden brown.',
      'Add tomato puree and spices, cook until the oil separates.',
      'Add marinated chicken, cook until tender.',
      'Pour in cream and simmer for a few minutes.',
      'Serve hot with naan or rice.'
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
      'Spices'
    ],
    qty: [
      '200g',
      '250g',
      '1',
      '3 cloves',
      '1 inch',
      '2',
      '2 tbsp',
      'as required'
    ],
    steps: [
      'Blanch the spinach and blend it into a puree.',
      'Heat oil in a pan, sauté cumin, onions, garlic, ginger, and chilies.',
      'Add spices and cook for 2 minutes.',
      'Add spinach puree, cook for 5 minutes.',
      'Add paneer cubes and cream, simmer for 5 minutes.',
      'Serve hot with roti or naan.'
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
      'Turmeric',
      'Oil'
    ],
    qty: ['2 cups', '3', '1', '2', '10', '1 tsp', '1/2 tsp', 'as required'],
    steps: [
      'Boil and mash the potatoes.',
      'Heat oil in a pan, add mustard seeds, curry leaves, and green chilies.',
      'Add onions and sauté until golden brown.',
      'Add turmeric and mashed potatoes, cook for 2 minutes.',
      'Spread dosa batter on a hot pan to make a thin crepe.',
      'Add the potato filling in the center, fold, and serve with chutney and sambar.'
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Meal(
    rating: '4.7',
    id: 'm24',
    categories: [
      'c4',
    ],
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
      'Spices (Biryani Masala, Cardamom, Cloves, Bay Leaf, Cinnamon)',
      'Saffron',
      'Ghee'
    ],
    qty: [
      '500g',
      '2 cups',
      '1 cup',
      '3',
      '2',
      '2 tbsp',
      'as required',
      'a pinch',
      '2 tbsp'
    ],
    steps: [
      'Marinate the chicken with yogurt, biryani masala, and salt for 2 hours.',
      'Cook rice with whole spices until 70% done.',
      'Fry onions until golden, then sauté ginger-garlic paste and tomatoes.',
      'Layer marinated chicken, fried onions, and rice in a pot.',
      'Add saffron milk and ghee, then cook on low heat for 30 minutes.',
      'Serve hot with raita.'
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),
  Meal(
    rating: '4.4',
    id: 'm25',
    categories: [
      'c4',
    ],
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
      'Spices ',
      'Oil',
      'Coriander Leaves'
    ],
    qty: [
      '1 cup',
      '1',
      '1 cup',
      '3 cloves',
      '1 inch',
      '2',
      'as required',
      '2 tbsp',
      'for garnish'
    ],
    steps: [
      'Soak and boil the kidney beans until soft.',
      'Heat oil, sauté cumin, onions, garlic, and ginger.',
      'Add tomato puree and spices, cook until oil separates.',
      'Add boiled kidney beans and simmer for 20 minutes.',
      'Garnish with coriander leaves and serve hot with rice.'
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),

  Meal(
    rating: '4.6',
    id: 'm26',
    categories: [
      'c4',
    ],
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
      'Spices',
      'Oil',
      'Coriander Leaves'
    ],
    qty: [
      '2',
      '1 small',
      '1',
      '1',
      '3 cloves',
      '1 inch',
      'as required',
      '2 tbsp',
      'for garnish'
    ],
    steps: [
      'Heat oil, add cumin seeds, garlic, and ginger.',
      'Add onions, tomatoes, and spices, cook until oil separates.',
      'Add diced potatoes and cauliflower florets, mix well.',
      'Cover and cook until vegetables are tender.',
      'Garnish with coriander leaves and serve hot.'
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Meal(
    rating: '4.3',
    id: 'm27',
    categories: [
      'c4',
    ],
    title: 'Chole Bhature',
    affordability: Affordability.affordable,
    complexity: Complexity.challenging,
    imageUrl:
        'https://media.vogue.in/wp-content/uploads/2020/08/chole-bhature-recipe.jpg',
    duration: 50,
    ingredients: [
      'Chickpeas',
      'Onions',
      'Tomatoes',
      'Ginger-Garlic Paste',
      'Spices ',
      'Flour',
      'Yogurt',
      'Oil'
    ],
    qty: [
      '1 cup',
      '2',
      '2',
      '1 tbsp',
      'as required',
      '2 cups',
      '1/4 cup',
      'for frying'
    ],
    steps: [
      'Soak and boil the chickpeas until soft.',
      'Sauté onions, ginger-garlic paste, and tomatoes with spices to make chole.',
      'Prepare dough with flour, yogurt, and water, then roll and fry bhature.',
      'Serve hot with chole.'
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),

  Meal(
    rating: '4.5',
    id: 'm28',
    categories: [
      'c4',
    ],
    title: 'Daal Tadka',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl:
        'https://www.mrishtanna.com/wp-content/uploads/2019/10/dal-tadka-instant-pot.jpg',
    duration: 25,
    ingredients: [
      'Lentils',
      'Tomatoes',
      'Onions',
      'Garlic',
      'Ginger',
      'Spices',
      'Ghee',
      'Coriander Leaves'
    ],
    qty: [
      '1 cup',
      '1',
      '1',
      '3 cloves',
      '1 inch',
      'as required',
      '1 tbsp',
      'for garnish'
    ],
    steps: [
      'Cook lentils until soft and mash slightly.',
      'Heat ghee, temper with cumin, mustard seeds, garlic, and spices.',
      'Add tomatoes and onions, cook until soft.',
      'Mix with cooked lentils and simmer for 5 minutes.',
      'Garnish with coriander leaves and serve hot with rice or roti.'
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),

  Meal(
    rating: '4.8',
    id: 'm29',
    categories: [
      'c4',
    ],
    title: 'Paneer Tikka',
    affordability: Affordability.affordable,
    complexity: Complexity.challenging,
    imageUrl:
        'https://spicecravings.com/wp-content/uploads/2020/10/Paneer-Tikka-Featured-1.jpg',
    duration: 30,
    ingredients: [
      'Paneer',
      'Yogurt',
      'Bell Peppers',
      'Onions',
      'Ginger-Garlic Paste',
      'Spices',
      'Lemon Juice',
      'Oil'
    ],
    qty: [
      '200g',
      '1/2 cup',
      '1',
      '1',
      '1 tbsp',
      'as required',
      '1 tbsp',
      'for brushing'
    ],
    steps: [
      'Marinate paneer and vegetables with yogurt, spices, and lemon juice.',
      'Skewer paneer and vegetables alternately.',
      'Grill or bake until golden, brushing with oil as needed.',
      'Serve hot with mint chutney.'
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
/////////////////// Italian///////////////////////
  Meal(
    rating: '4.8',
    id: 'm10',
    categories: [
      'c2',
    ],
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
    qty: ['1 ball', '1/2 cup', '200g', '8-10', '1 tbsp'],
    steps: [
      'Preheat oven to the highest temperature.',
      'Roll out the pizza dough to a thin crust.',
      'Spread tomato sauce evenly on the dough.',
      'Add sliced mozzarella and basil leaves on top.',
      'Drizzle olive oil and bake for 10-12 minutes until crust is golden.',
      'Serve hot and enjoy!'
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),

  Meal(
    rating: '4.6',
    id: 'm11',
    categories: [
      'c2',
    ],
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
    qty: ['250g', '2', '1/2 cup', '100g', 'to taste'],
    steps: [
      'Cook spaghetti until al dente and save some pasta water.',
      'Fry guanciale until crispy in a pan.',
      'Whisk eggs and cheese together in a bowl.',
      'Mix spaghetti with guanciale, then add the egg mixture.',
      'Add pasta water to achieve creamy texture.',
      'Serve with extra cheese and black pepper.'
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),
  Meal(
    rating: '4.9',
    id: 'm12',
    categories: [
      'c2',
    ],
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
    qty: ['1 cup', '4 cups', '1', '2 tbsp', 'a pinch', '1/4 cup', '1/4 cup'],
    steps: [
      'Sauté onion in butter until translucent.',
      'Add rice and toast for 2 minutes.',
      'Deglaze with white wine and let it evaporate.',
      'Add hot chicken stock, one ladle at a time, stirring constantly.',
      'Mix saffron in the last ladle of stock and add to rice.',
      'Stir in parmesan cheese and butter for creaminess.',
      'Serve hot as a main dish.'
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),
  Meal(
    rating: '4.5',
    id: 'm13',
    categories: [
      'c2',
    ],
    title: 'Lasagna Bolognese',
    affordability: Affordability.pricey,
    complexity: Complexity.hard,
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSF8CGRmcJd9zoDuGSm6Y8yPf18AYlUesFWaw&s',
    duration: 90,
    ingredients: [
      'Lasagna Sheets',
      'Bolognese Sauce',
      'Béchamel Sauce',
      'Parmesan Cheese',
      'Mozzarella Cheese'
    ],
    qty: ['12', '2 cups', '2 cups', '1/2 cup', '1/2 cup'],
    steps: [
      'Preheat oven to 180°C (350°F).',
      'Layer lasagna sheets with bolognese, béchamel, and cheeses in a baking dish.',
      'Repeat until ingredients are used, ending with béchamel and cheese.',
      'Bake for 40-45 minutes until golden and bubbly.',
      'Let it rest for 10 minutes before serving.'
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),

  Meal(
    rating: '4.3',
    id: 'm14',
    categories: [
      'c2',
    ],
    title: 'Pesto Pasta',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl:
        'https://richanddelish.com/wp-content/uploads/2023/02/creamy-pesto-pasta-1.jpg',
    duration: 20,
    ingredients: [
      'Pasta',
      'Basil Pesto',
      'Parmesan Cheese',
      'Olive Oil',
      'Pine Nuts'
    ],
    qty: ['250g', '1/2 cup', '1/4 cup', '1 tbsp', '2 tbsp'],
    steps: [
      'Cook pasta until al dente.',
      'Toss pasta with pesto and olive oil in a bowl.',
      'Garnish with parmesan cheese and toasted pine nuts.',
      'Serve immediately for best flavor.'
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),

  Meal(
    rating: '4.9',
    id: 'm15',
    categories: [
      'c2',
    ],
    title: 'Tiramisu',
    affordability: Affordability.pricey,
    complexity: Complexity.challenging,
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkt8t2u0Tfa3zHkKZRorSk0otjBTYA3WgNkg&s',
    duration: 30,
    ingredients: [
      'Ladyfingers',
      'Mascarpone Cheese',
      'Espresso',
      'Cocoa Powder',
      'Sugar',
      'Eggs'
    ],
    qty: ['20', '250g', '1 cup', '2 tbsp', '1/4 cup', '2'],
    steps: [
      'Beat egg yolks and sugar until pale and creamy.',
      'Fold in mascarpone cheese to form a smooth mixture.',
      'Dip ladyfingers in espresso and layer in a dish.',
      'Spread mascarpone mixture on top, repeat layers.',
      'Dust with cocoa powder and chill for 4 hours before serving.'
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
    duration: 10,
    ingredients: [
      'Tomatoes',
      'Fresh Mozzarella',
      'Basil Leaves',
      'Olive Oil',
      'Balsamic Glaze'
    ],
    qty: ['3', '200g', '10', '1 tbsp', '1 tbsp'],
    steps: [
      'Slice tomatoes and mozzarella into even rounds.',
      'Arrange slices alternately with basil leaves on a plate.',
      'Drizzle olive oil and balsamic glaze over the salad.',
      'Serve fresh as a starter or side dish.'
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
    duration: 120,
    ingredients: ['Flour', 'Olive Oil', 'Yeast', 'Salt', 'Rosemary'],
    qty: ['500g', '1/4 cup', '1 tbsp', '1 tsp', '2 tbsp'],
    steps: [
      'Mix flour, yeast, salt, and water to form a dough.',
      'Knead until smooth, then let it rise for 1 hour.',
      'Press the dough into a baking sheet, add olive oil and rosemary.',
      'Bake at 200°C (400°F) for 20-25 minutes until golden.',
      'Cool and serve.'
    ],
    isGlutenFree: false,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  ////////////////Chinese/////////////////////
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
    duration: 25,
    ingredients: [
      'Chicken Breast',
      'Peanuts',
      'Dried Red Chilies',
      'Garlic',
      'Soy Sauce',
      'Cornstarch',
      'Sugar'
    ],
    qty: ['500g', '1/4 cup', '5-6', '2 cloves', '3 tbsp', '1 tbsp', '1 tsp'],
    steps: [
      'Dice chicken and marinate in soy sauce and cornstarch.',
      'Stir-fry peanuts until golden, then set aside.',
      'Fry dried chilies and garlic in oil until fragrant.',
      'Add chicken and cook until golden brown.',
      'Stir in sauce mixture and peanuts, cooking until thickened.',
      'Serve with steamed rice.'
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
    duration: 30,
    ingredients: [
      'Pork Belly',
      'Pineapple',
      'Bell Peppers',
      'Vinegar',
      'Ketchup',
      'Sugar',
      'Cornstarch'
    ],
    qty: ['300g', '1/2 cup', '1', '2 tbsp', '3 tbsp', '1 tbsp', '2 tbsp'],
    steps: [
      'Coat pork pieces in cornstarch and fry until crispy.',
      'Stir-fry bell peppers and pineapple in oil.',
      'Mix vinegar, ketchup, sugar, and cornstarch to form a sauce.',
      'Add fried pork and sauce to the pan.',
      'Cook until the sauce thickens and coats the pork.',
      'Serve hot with steamed rice.'
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
    duration: 20,
    ingredients: [
      'Tofu',
      'Ground Pork',
      'Doubanjiang (Chili Bean Paste)',
      'Garlic',
      'Ginger',
      'Soy Sauce',
      'Sichuan Peppercorns'
    ],
    qty: ['300g', '150g', '1 tbsp', '2 cloves', '1 tsp', '2 tbsp', '1 tsp'],
    steps: [
      'Fry garlic, ginger, and doubanjiang in oil until fragrant.',
      'Add ground pork and cook until browned.',
      'Add tofu and gently mix to avoid breaking.',
      'Add soy sauce and a bit of water, simmer for 5 minutes.',
      'Garnish with ground Sichuan peppercorns and serve hot.'
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
    duration: 30,
    ingredients: [
      'Spring Roll Wrappers',
      'Cabbage',
      'Carrot',
      'Mushrooms',
      'Soy Sauce',
      'Oil'
    ],
    qty: ['10', '1 cup', '1/2 cup', '1/4 cup', '2 tbsp', 'as needed'],
    steps: [
      'Shred vegetables and stir-fry with soy sauce until tender.',
      'Place filling on wrappers and roll tightly.',
      'Seal edges with water.',
      'Fry in hot oil until golden and crispy.',
      'Serve with dipping sauce.'
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
    duration: 25,
    ingredients: [
      'Mushrooms',
      'Tofu',
      'Vinegar',
      'Soy Sauce',
      'Egg',
      'Cornstarch',
      'White Pepper'
    ],
    qty: ['1 cup', '100g', '2 tbsp', '2 tbsp', '1', '1 tbsp', '1 tsp'],
    steps: [
      'Bring water to a boil and add mushrooms and tofu.',
      'Stir in vinegar, soy sauce, and white pepper.',
      'Mix cornstarch with water and add to thicken soup.',
      'Drizzle beaten egg slowly while stirring.',
      'Serve hot as an appetizer.'
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Meal(
    rating: '4.7',
    id: 'm33',
    categories: [
      'c3',
    ],
    title: 'Beef Chow Fun',
    affordability: Affordability.affordable,
    complexity: Complexity.challenging,
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQB94D6M6fGzZEYvAEIvoBCa4gJgDeXfHKNpg&s',
    duration: 30,
    ingredients: [
      'Flat Rice Noodles',
      'Beef Slices',
      'Soy Sauce',
      'Bean Sprouts',
      'Garlic',
      'Oyster Sauce'
    ],
    qty: ['300g', '200g', '2 tbsp', '1 cup', '2 cloves', '1 tbsp'],
    steps: [
      'Stir-fry beef until browned and set aside.',
      'Fry garlic and noodles until slightly charred.',
      'Add soy sauce, oyster sauce, and bean sprouts.',
      'Mix in beef and cook for 2 minutes.',
      'Serve hot and enjoy!'
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Meal(
    rating: '4.8',
    id: 'm34',
    categories: [
      'c3',
    ],
    title: 'Dim Sum Dumplings',
    affordability: Affordability.affordable,
    complexity: Complexity.hard,
    imageUrl:
        'https://allwaysdelicious.com/wp-content/uploads/2021/01/har-gow-sq-1.jpg',
    duration: 40,
    ingredients: [
      'Dumpling Wrappers',
      'Shrimp',
      'Pork',
      'Ginger',
      'Soy Sauce',
      'Sesame Oil'
    ],
    qty: ['20', '150g', '150g', '1 tsp', '2 tbsp', '1 tsp'],
    steps: [
      'Mix shrimp, pork, ginger, soy sauce, and sesame oil into a filling.',
      'Place filling in wrappers and seal tightly.',
      'Steam dumplings for 10-12 minutes.',
      'Serve with soy dipping sauce.'
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
];
