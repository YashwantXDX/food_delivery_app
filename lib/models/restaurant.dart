import 'package:food_delivery_app/models/food.dart';

class Restaurant {
  // list of food menu
  final List<Food> _menu = [
    //burgers

    Food(
      name: "Classic Cheeseburger",
      description:
          "A juicy cheese patty with cheddar, lettuce, tomato, and a hint of onion and pickle.",
      imagePath: "assets/images/burgers/cheeseburger.jpg",
      price: 159,
      category: FoodCategory.burgers,
      availableAddons: [
        Addons(name: "Extra Cheese", price: 50),
        Addons(name: "Lettuce", price: 10),
        Addons(name: "Onion", price: 20),
      ],
    ),

    Food(
      name: "Chicken Maharaja Mac",
      description:
          "A delectable patty made of green goodness, potatoes, peas, carrots and selection of Indian spices. Topped with crispy lettuce, mayonnaise, packed into sesame toasted buns.",
      imagePath: "assets/images/burgers/Chicken Maharaja Mac.jpg",
      price: 459,
      category: FoodCategory.burgers,
      availableAddons: [
        Addons(name: "Extra Cheese", price: 50),
        Addons(name: "Lettuce", price: 10),
        Addons(name: "Onion", price: 20),
      ],
    ),

    Food(
      name: "McAloo Tikki",
      description:
          "The combination of a potato and peas patty with special Indian spices coated with breadcrumbs, served with sweet tomato mayo, fresh onions",
      imagePath: "assets/images/burgers/McAloo-tikki1.jpg",
      price: 109,
      category: FoodCategory.burgers,
      availableAddons: [
        Addons(name: "Extra Cheese", price: 50),
        Addons(name: "Lettuce", price: 10),
        Addons(name: "Onion", price: 20),
      ],
    ),

    Food(
      name: "McVeggie",
      description:
          "The vegetarian-based burger contains a battered and breaded patty which is made of peas, corn, carrots, green beans, onions, potatoes, rice and spices, served in a sesame toasted bun with eggless mayonnaise and lettuce.",
      imagePath: "assets/images/burgers/McVeggie.jpg",
      price: 189,
      category: FoodCategory.burgers,
      availableAddons: [
        Addons(name: "Extra Cheese", price: 50),
        Addons(name: "Lettuce", price: 10),
        Addons(name: "Onion", price: 20),
      ],
    ),

    Food(
      name: "American Cheese Supreme Veg",
      description:
          "Think jalapenos, corn, grilled chicken, and the crown jewel – lots and lots of cheese. In fact, this burger is so cheesy that you might just have to eat it with both hands to stop the cheese from running out.",
      imagePath: "assets/images/burgers/cheeseburger.jpg",
      price: 159,
      category: FoodCategory.burgers,
      availableAddons: [
        Addons(name: "Extra Cheese", price: 50),
        Addons(name: "Lettuce", price: 10),
        Addons(name: "Onion", price: 20),
      ],
    ),

    //salads
    Food(
      name: "Laccha Pyaaz",
      description:
      "Onion salad recipe made with sliced onion rings, lemon juice, fresh herbs, and Indian spices.",
      imagePath: "assets/images/salads/Laccha pyaaz.jpg",
      price: 69,
      category: FoodCategory.salads,
      availableAddons: [

      ],
    ),

    Food(
      name: "Kachumber Salad Recipe",
      description:
      "Salad recipe made with freshly diced cucumber, tomatoes, onions, chili peppers and lime juice.",
      imagePath: "assets/images/salads/Kachumber Salad Recipe.jpg",
      price: 59,
      category: FoodCategory.salads,
      availableAddons: [

      ],
    ),

    Food(
      name: "Corn Pomegranate Kosambari",
      description:
      "Salad made with corn, pomegranate, and coconut and tempered with a few spices.",
      imagePath: "assets/images/salads/Corn Pomegranate Kosambari.jpg",
      price: 79,
      category: FoodCategory.salads,
      availableAddons: [

      ],
    ),

    //sides
    Food(
      name: "Garlic Bread",
      description:
      "Bread with fresh herbs, tons of flavorful roasted garlic, and is perfectly toasted.",
      imagePath: "assets/images/sides/Garlic-Bread.jpg",
      price: 179,
      category: FoodCategory.sides,
      availableAddons: [
        Addons(name: "Cheese", price: 50),
      ],
    ),

    Food(
      name: "Mexican Taco",
      description:
      "A traditional Mexican food consisting of a small hand-sized corn- or wheat-based tortilla topped with a filling.",
      imagePath: "assets/images/sides/Mexican Taco.jpg",
      price: 149,
      category: FoodCategory.sides,
      availableAddons: [

      ],
    ),

    //desserts
    Food(
      name: "Choco Lava Cake",
      description:
      "Cake filled with more and more melting chocolate.",
      imagePath: "assets/images/desserts/Choco Lava Cake.jpg",
      price: 219,
      category: FoodCategory.desserts,
      availableAddons: [

      ],
    ),

    Food(
      name: "Red Velvet Cake",
      description:
      "Cake with superior buttery, vanilla, and cocoa flavors, as well as a delicious tang from buttermilk.",
      imagePath: "assets/images/desserts/Red Valvet Cake.jpg",
      price: 249,
      category: FoodCategory.desserts,
      availableAddons: [

      ],
    ),

    //drinks
    Food(
      name: "Coco Cola",
      description:
      "Coco Cola Drink 500ml",
      imagePath: "assets/images/drinks/Coco Cola.jpg",
      price: 49,
      category: FoodCategory.drinks,
      availableAddons: [

      ],
    ),

    Food(
      name: "Fanta",
      description:
      "Fanta 500ml",
      imagePath: "assets/images/drinks/Fanta.jpg",
      price: 49,
      category: FoodCategory.drinks,
      availableAddons: [

      ],
    ),

    Food(
      name: "Sprite",
      description:
      "Sprite 500ml",
      imagePath: "assets/images/drinks/Sprite.jpg",
      price: 49,
      category: FoodCategory.drinks,
      availableAddons: [

      ],
    ),


  ];
}
