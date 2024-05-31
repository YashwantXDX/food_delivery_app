import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/payment_page.dart';
import 'package:food_delivery_app/services/payment/UpiPayment.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class SelectModeOfPaymentPage extends StatelessWidget {
  const SelectModeOfPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {

    double amount = context.read<Restaurant>().getTotalPrice();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Select Mode of Payment",style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [

            const Gap(30),

            Center(
              child: TextButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentPage(),)),
                child: Container(
                  width: MediaQuery.of(context).size.width - 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      // image icon
                      Icon(Icons.credit_card,color: Theme.of(context).colorScheme.inversePrimary,),
                      // mode of payment
                      Text("Debit / Credit Card",style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
                      // arrow icon
                      Icon(Icons.arrow_forward_ios_sharp,color: Theme.of(context).colorScheme.inversePrimary,),

                    ],

                  ),
                ),
              ),
            ),

            const Gap(40),

            Center(
              child: TextButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => RazorPayPage(amount),)),
                child: Container(
                  width: MediaQuery.of(context).size.width - 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      // image icon
                      Icon(Icons.stay_current_portrait,color: Theme.of(context).colorScheme.inversePrimary,),
                      // mode of payment
                      Text("Razor Pay",style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
                      // arrow icon
                      Icon(Icons.arrow_forward_ios_sharp,color: Theme.of(context).colorScheme.inversePrimary,),

                    ],

                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
