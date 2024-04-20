import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:provider/provider.dart';

class MyCurrentLocation extends StatefulWidget {
  const MyCurrentLocation({super.key});

  @override
  State<MyCurrentLocation> createState() => _MyCurrentLocationState();
}

class _MyCurrentLocationState extends State<MyCurrentLocation> {
  final textController = TextEditingController();

  void openLocationSearchBox(BuildContext context){
    showDialog(context: context, builder: (context) => AlertDialog(
      title: const Text("Your Location"),
      content: TextField(controller: textController,decoration: InputDecoration(
        hintText: "Enter Address...",
      ),),
      actions: [

        //Cancel Button
        MaterialButton(onPressed: () => Navigator.pop(context),child: const Text("Cancel"),),

        //Save Button
        MaterialButton(onPressed: () {

          //update delivery address
          String newAddress = textController.text;
          context.read<Restaurant>().updateDeliveryAddress(newAddress);
          Navigator.pop(context);
          textController.clear();

        },
        child: const Text("Save"),),

      ],
    ),);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Deliver Now",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          GestureDetector(
            onTap: () => openLocationSearchBox(context),
            child: Row(
              children: [
                //address
                Consumer<Restaurant>(builder: (context, restaurant, child) => Text(
                  restaurant.deliveryAddress,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),),

                //drop down menu
                const Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
