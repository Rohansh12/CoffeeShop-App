import 'package:coffeeshop/components/coffee_tile.dart';
import 'package:coffeeshop/models/coffee.dart';
import 'package:coffeeshop/models/coffee_shop.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  //add coffee to cart
  void addToCart(Coffee coffee){
    Provider.of<CoffeeShop>(context,listen: false).addItemToCart(coffee);

    // showDialog(
    //   context: context,
    //   builder: (context) => AlertDialog(
    //     title: Text("Successfully added to cart"),
    //   ),
    // );

  }

  void removeFromCart(Coffee coffee){
    Provider.of<CoffeeShop>(context, listen:false ).removeItemFromCart(coffee);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(builder: (context,value,child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              const Text("How would you like your coffee?",
              style: TextStyle(fontSize: 20),
              ),

              const SizedBox(height: 25),

              //list of coffee to buy
              Expanded(
                  child: ListView.builder(
                      itemCount: value.coffeeShop.length,
                      itemBuilder: (context,index){

                        //get individual coffee
                        Coffee eachCoffee = value.coffeeShop[index];

                        //return the title for this coffee
                        return CoffeeTile(coffee:eachCoffee,
                          icon:Icon(Icons.add),
                          onPressed: () => addToCart(eachCoffee),
                          onRemovePressed: () => removeFromCart(eachCoffee),
                        );

                  }) )
            ],
          ),
        )
    ),);
  }
}
