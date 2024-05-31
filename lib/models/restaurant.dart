import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/cart_item.dart';
import 'package:food_delivery_app/models/food.dart';
import 'package:intl/intl.dart';

class Restaurant extends ChangeNotifier {
  // list of food menu
  final List<Food> _menu = [
    //burgers

    Food(
      name: "Classic Cheese Burger",
      description:
          "A juicy cheese patty with cheddar, lettuce, tomato, and a hint of onion and pickle.",
      imagePath: "assets/images/burgers/cheeseburger.jpg",
      price: 159,
      category: FoodCategory.Burgers,
      availableAddons: [
        Addons(name: "Extra Cheese", price: 50),
        Addons(name: "Lettuce", price: 10),
        Addons(name: "Onion", price: 20),
      ],
    ),

    Food(
      name: "Chicken Maharaja Mac Burger",
      description:
          "A delectable patty made of green goodness, potatoes, peas, carrots and selection of Indian spices. Topped with crispy lettuce, mayonnaise, packed into sesame toasted buns.",
      imagePath: "assets/images/burgers/Chicken Maharaja Mac.jpg",
      price: 459,
      category: FoodCategory.Burgers,
      availableAddons: [
        Addons(name: "Extra Cheese", price: 50),
        Addons(name: "Lettuce", price: 10),
        Addons(name: "Onion", price: 20),
      ],
    ),

    Food(
      name: "McAloo Tikki Burger",
      description:
          "The combination of a potato and peas patty with special Indian spices coated with breadcrumbs, served with sweet tomato mayo, fresh onions",
      imagePath: "assets/images/burgers/McAloo-tikki1.jpg",
      price: 109,
      category: FoodCategory.Burgers,
      availableAddons: [
        Addons(name: "Extra Cheese", price: 50),
        Addons(name: "Lettuce", price: 10),
        Addons(name: "Onion", price: 20),
      ],
    ),

    Food(
      name: "McVeggie Burger",
      description:
          "The vegetarian-based burger contains a battered and breaded patty which is made of peas, corn, carrots, green beans, onions, potatoes, rice and spices, served in a sesame toasted bun with eggless mayonnaise and lettuce.",
      imagePath: "assets/images/burgers/McVeggie.jpg",
      price: 189,
      category: FoodCategory.Burgers,
      availableAddons: [
        Addons(name: "Extra Cheese", price: 50),
        Addons(name: "Lettuce", price: 10),
        Addons(name: "Onion", price: 20),
      ],
    ),

    Food(
      name: "American Cheese Supreme Veg Burger",
      description:
          "Think jalapenos, corn, grilled chicken, and the crown jewel – lots and lots of cheese. In fact, this burger is so cheesy that you might just have to eat it with both hands to stop the cheese from running out.",
      imagePath: "assets/images/burgers/American Cheese Supreme Veg.jpg",
      price: 159,
      category: FoodCategory.Burgers,
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
      category: FoodCategory.Salads,
      availableAddons: [
        Addons(name: "Spoon", price: 5),
      ],
    ),

    Food(
      name: "Kachumber Salad Recipe",
      description:
          "Salad recipe made with freshly diced cucumber, tomatoes, onions, chili peppers and lime juice.",
      imagePath: "assets/images/salads/Kachumber Salad Recipe.jpg",
      price: 59,
      category: FoodCategory.Salads,
      availableAddons: [
        Addons(name: "Spoon", price: 5),
      ],
    ),

    Food(
      name: "Corn Pomegranate Kosambari",
      description:
          "Salad made with corn, pomegranate, and coconut and tempered with a few spices.",
      imagePath: "assets/images/salads/Corn Pomegranate Kosambari.jpg",
      price: 79,
      category: FoodCategory.Salads,
      availableAddons: [
        Addons(name: "Spoon", price: 5),
      ],
    ),

    //sides
    Food(
      name: "Garlic Bread",
      description:
          "Bread with fresh herbs, tons of flavorful roasted garlic, and is perfectly toasted.",
      imagePath: "assets/images/sides/Garlic-Bread.jpg",
      price: 179,
      category: FoodCategory.Sides,
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
      category: FoodCategory.Sides,
      availableAddons: [
        Addons(name: "Extra Taco", price: 50),
      ],
    ),

    //desserts
    Food(
      name: "Choco Lava Cake",
      description: "Cake filled with more and more melting chocolate.",
      imagePath: "assets/images/desserts/Choco Lava Cake.jpg",
      price: 219,
      category: FoodCategory.Desserts,
      availableAddons: [
        Addons(name: "Spoon", price: 5),
      ],
    ),

    Food(
      name: "Red Velvet Cake",
      description:
          "Cake with superior buttery, vanilla, and cocoa flavors, as well as a delicious tang from buttermilk.",
      imagePath: "assets/images/desserts/Red Valvet Cake.jpg",
      price: 249,
      category: FoodCategory.Desserts,
      availableAddons: [
        Addons(name: "Spoon", price: 5),
      ],
    ),

    //drinks
    Food(
      name: "Coco Cola",
      description: "Coco Cola Drink 500ml",
      imagePath: "assets/images/drinks/Coco Cola.jpg",
      price: 49,
      category: FoodCategory.Drinks,
      availableAddons: [
        Addons(name: "Extra Cup", price: 10),
      ],
    ),

    Food(
      name: "Fanta",
      description: "Fanta 500ml",
      imagePath: "assets/images/drinks/Fanta.jpg",
      price: 49,
      category: FoodCategory.Drinks,
      availableAddons: [
        Addons(name: "Extra Cup", price: 10),
      ],
    ),

    Food(
      name: "Sprite",
      description: "Sprite 500ml",
      imagePath: "assets/images/drinks/Sprite.jpg",
      price: 1,
      category: FoodCategory.Drinks,
      availableAddons: [
        Addons(name: "Extra Cup", price: 10),
      ],
    ),
  ];

  // user cart
  final List<CartItem> _cart = [];

  // delivery address (which user can change / update)
  String _deliveryAddress = "Rajeev Nagar";


  /*

  G E T T E R S

  */

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

  /*

  O P E R A T I O N S

  */



  // add to cart
  void addToCart(Food food, List<Addons> selectedAddons) {
    //see if there is a cart item already with the same food and selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      // check if the food items are the same
      bool isSameFood = item.food == food;

      // check if the list of selected addons are the same
      bool isSameAddons =
          const ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });

    //if item already exists, increase it's quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }

    //otherwise, add new cart item to the cart
    else {
      _cart.add(
        CartItem(food: food, selectedAddons: selectedAddons),
      );
    }

    notifyListeners();
  }

  // remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }

    notifyListeners();
  }

  // get total price of cart
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addons addons in cartItem.selectedAddons) {
        itemTotal += addons.price;
      }

      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

  // get total number of items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }

    return totalItemCount;
  }

  // clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  // update delivery address
  void updateDeliveryAddress(String newAddress){
    _deliveryAddress = newAddress;
    notifyListeners();
  }

  /*

  H E L P E R S

  */

  // generate a receipt
  String displayCartReceipt(){
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt");
    receipt.writeln();

    //format date to include up to seconds only
    String formattedDate = DateFormat('yyy-MM-dd HH:mm:ss').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("------------");

    for(final cartItem in _cart){
      receipt.writeln("${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      if(cartItem.selectedAddons.isNotEmpty){
        receipt.writeln("    Add-ons : ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }
    receipt.writeln("------------");
    receipt.writeln();
    receipt.writeln("Total Items : ${getTotalItemCount()}");
    receipt.writeln("Total Price : ${_formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln("Delivering to : $deliveryAddress");

    return receipt.toString();
  }

  // format double value into money
  String _formatPrice(double price) {
    return "Rs. ${price.toStringAsFixed(2)}";
  }

  // format list of addons into a string summary
  String _formatAddons(List<Addons> addons) {
    return addons
        .map((addon) => "Rs.${addon.name} (${_formatPrice(addon.price)})")
        .join(", ");
  }
}
