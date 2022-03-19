import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:shopping_api_gdsc/Product/product-class.dart';


class CartModel extends ChangeNotifier {
  /// Internal, private state of the cart.
  List<Product> myItems = [];

  /// An unmodifiable view of the items in the cart.
  UnmodifiableListView<Product> get items => UnmodifiableListView(myItems);

  /// The current total price of all items (assuming all items cost $42).
  double get totalPrice{
    double price = 0;
    for(int i = 0;i < myItems.length;i++){
      price += double.parse(myItems[i].price);
    }
    return price;
  }


  void add(Product item) {
    myItems.add(item);

    notifyListeners();
  }

  void removeItem(Product item){
    myItems.remove(item);
    notifyListeners();
  }

  void printItems(){
    if (kDebugMode) {
      print(myItems.map((e) => e.id));
    }
  }




  void removeAll() {
    myItems.clear();
    notifyListeners();
  }
}