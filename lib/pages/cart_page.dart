import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/components/my_cart_tile.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'delivery_in_progress_page.dart';


class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {


  late Razorpay _razorpay;

  void openCheckout(amount) async{
    amount =  amount * 100;
    var options = {
      'key' : 'rzp_test_1DP5mmOlF5G5ag',
      'amount' : amount,
      'name' : 'Yashwant Choure',
      'prefill' : {'contact' : '8319785116', 'email' : 'yashwant.choure73546@gmail.com'},
      'external' : {
        'wallets' : ['paytm','phonepe']
      }
    };

    try{
      _razorpay.open(options);
    }

    catch(e){
      debugPrint('Error : e');
    }
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) async{
    Navigator.push(context, MaterialPageRoute(builder: (context) => const DeliveryProgressPage(),));
  }

  void handlePaymentFailure(PaymentFailureResponse response){
    Fluttertoast.showToast(msg: "Payment Failure " + response.message!);
  }

  void handleExternalWallet(ExternalWalletResponse response){
    Fluttertoast.showToast(msg: "External Wallet" + response.walletName!,toastLength: Toast.LENGTH_SHORT);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentFailure);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  }

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
                    openCheckout(restaurant.getTotalPrice());
                  }
                  else{
                    showDialog(context: context, builder: (context) => const AlertDialog(content: Text("Cart is Empty.."),),);
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
