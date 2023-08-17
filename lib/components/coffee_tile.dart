import 'package:provider/provider.dart';

import '../models/coffee.dart';
import 'package:flutter/material.dart';

import '../models/coffee_shop.dart';

class CoffeeTile extends StatelessWidget {
  final Coffee coffee;
  final Widget icon;
  void Function()? onPressed;
  void Function()? onRemovePressed;

  CoffeeTile(
      {super.key, required this.coffee, required this.onPressed,required this.onRemovePressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    int quantity = Provider.of<CoffeeShop>(context).getQuantity(coffee);
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      child: ListTile(
        title: Text(coffee.name),
        subtitle: Text(coffee.price),
        leading: Image.asset(coffee.imagePath),
        trailing:quantity > 0
        ?Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
                icon: Icon(Icons.remove),
            onPressed: onRemovePressed,
            ),
            Text(quantity.toString()),
            IconButton(
              icon:icon,
              onPressed: onPressed,
            )
          ],
        )
        :IconButton(
          icon: icon,
          onPressed: onPressed,
        ),

      ),
    );
  }

}
