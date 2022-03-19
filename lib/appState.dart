import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:shopping_api_gdsc/Product/product-class.dart';


class CartModel extends ChangeNotifier {

  List<Product> myItems = [];


  UnmodifiableListView<Product> get items => UnmodifiableListView(myItems);


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

  bool exist(Product product){
    return myItems.contains(product);
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