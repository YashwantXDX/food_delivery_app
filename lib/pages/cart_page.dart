import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/components/my_cart_tile.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:food_delivery_app/services/payment/UpiPayment.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restaurant, child) {
      // cart
      final userCart = restaurant.cart;

      // scaffold UI
      return Scaffold(
        appBar: AppBar(
          title: const Text("Cart"),
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            //clear cart button
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text(
                          "Are you sure you want to clear the cart?"),
                      actions: [
                        // cancel button
                        TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Cancel")),

                        // yes button
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              restaurant.clearCart();
                            },
                            child: const Text("Yes")),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.delete)),
          ],
        ),
        body: Column(
          children: [
            //list of cart
            Expanded(
              child: Column(
                children: [
                  userCart.isEmpty
                      ? const Expanded(
                          child: Center(child: Text("Cart is Empty..")))
                      : Expanded(
                          child: ListView.builder(
                          itemBuilder: (context, index) {
                            //get individual cart item
                            final cartItem = userCart[index];

                            //return cart tile
                            return MyCartTile(cartItem: cartItem);
                          },
                          itemCount: userCart.length,
                        )),
                ],
              ),
            ),

            //button to pay
            MyButton(
                onTap: () {
                  if(restaurant.getTotalPrice() != 0.0){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpiPaymentPage(),
                        ));
                  }
                  else{
                    showDialog(context: context, builder: (context) => AlertDialog(content: Text("Cart is Empty.."),),);
                  }
                },
                text: "Payable Amount : ${restaurant.getTotalPrice()}"),

            const Gap(25),
          ],
        ),
      );
    });
  }
}
