import 'package:flutter/material.dart';
import 'coffee.dart';

class CoffeeShop extends ChangeNotifier {
  final List<Coffee> _shop = [
    //black coffee
    Coffee(name: 'Long Black', price: '210', imagePath: 'lib/images/black.png'),
    Coffee(name: 'Latte', price: '220', imagePath: 'lib/images/latte.png'),
    Coffee(name: 'Espresso', price: '200', imagePath: 'lib/images/expresso.png'),
    Coffee(name: 'Iced Tea', price: '190', imagePath: 'lib/images/iced tea.png'),
  ];


  //user cart
  List<Coffee> _userCart = [];

  //get Coffee List
  List<Coffee> get coffeeShop => _shop;

  //get user cart
  List <Coffee> get userCart => _userCart;

  int getQuantity(Coffee coffee){
    var existingCoffee = _userCart.indexWhere((item) => item.name==coffee.name);
    if(existingCoffee != -1){
      return _userCart[existingCoffee].quantity;
    }
    return 0;
  }

  //add item to cart
  void addItemToCart(Coffee coffee){
    var existingCoffee = _userCart.indexWhere((item) => item.name == coffee.name);
    if(existingCoffee != -1){
      _userCart[existingCoffee].quantity++;
    }else{
      _userCart.add(coffee);
    }
    notifyListeners();
  }

  //remove item from cart
  void removeItemFromCart(Coffee coffee){
    var existingCoffee = _userCart.indexWhere((item) => item.name == coffee.name);
    if(existingCoffee != -1 ){
      if(_userCart[existingCoffee].quantity > 1){
        _userCart[existingCoffee].quantity--;
      }else{
        _userCart.remove(coffee);
      }
      notifyListeners();
    }
  }

  void clearCart() {
    _userCart.clear();
    notifyListeners();
  }





}