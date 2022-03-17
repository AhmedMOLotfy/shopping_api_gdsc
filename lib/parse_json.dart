import 'dart:convert';

import 'Product/product-class.dart';
import 'package:http/http.dart' as http;

Future<List<Product>> fetchData() async {
  final response = await http.get(
    Uri.parse('https://fakestoreapi.com/products'),
  );
  Iterable l = json.decode(response.body);
  List<Product> posts =
      List<Product>.from(l.map((model) => Product.fromJson(model)));
  if (response.statusCode == 200) {
    return posts;
  } else {
    throw Exception('Failed to load album');
  }
}
