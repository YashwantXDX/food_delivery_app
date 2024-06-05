import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:food_delivery_app/pages/cart_page.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';

class MySliverAppBar extends StatefulWidget {
  final Widget child;
  final Widget title;

  const MySliverAppBar({super.key, required this.child, required this.title});

  @override
  State<MySliverAppBar> createState() => _MySliverAppBarState();
}

class _MySliverAppBarState extends State<MySliverAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 340,
      collapsedHeight: 120,
      floating: false,
      pinned: true,
      actions: [
        badges.Badge(position: badges.BadgePosition.custom(start: 30,bottom: 25),
          badgeContent: Consumer<Restaurant>(
            builder: (context, restaurant, child) {
              return Text(
                restaurant.cart.length.toString(),
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              );
            },
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,0,10,0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartPage(),
                    ));
              },
              icon: const Icon(Icons.shopping_cart),
            ),
          ),
        ),

      ],
      backgroundColor: Theme.of(context).colorScheme.background,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text("Yashwant's Restauro"),
      centerTitle: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: widget.child,
        ),
        title: widget.title,
        centerTitle: true,
        titlePadding: const EdgeInsets.only(left: 0, right: 0, top: 0),
        expandedTitleScale: 1,
      ),
    );
  }
}
