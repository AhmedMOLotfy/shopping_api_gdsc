import 'package:flutter/material.dart';
import 'package:shopping_api_gdsc/parse_json.dart';
import 'package:shopping_api_gdsc/productDescription.dart';
import 'package:shopping_api_gdsc/upper.dart';
import 'package:shopping_api_gdsc/Product/product-class.dart';

class MainBody extends StatefulWidget {
  const MainBody({Key? key}) : super(key: key);

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  late Future<List<Product>> futureAlbum;
  final _saved = <String>[];

  @override
  void initState() {
    futureAlbum = fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        columnUpper,
        FutureBuilder<List<Product>>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: GridView.count(
                        primary: false,
                        padding: const EdgeInsets.all(20),
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 8,
                        crossAxisCount: 2,
                        children: snapshot.data!
                            .map((e) => _buildProducts(e))
                            .toList(),
                      ),
                    )
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ],
    );
  }

  Widget _buildProducts(Product product) {
    final added = _saved.contains(product.title);
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ProductDescription(
              product: product,
            );
          }));
        },
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text("\$"),
                    Text(product.price),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (added) {
                        _saved.remove(product.title);
                      } else {
                        _saved.add(product.title);
                      }
                    });
                  },
                  child: _saved.contains(product.title)
                      ? const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      : const Icon(
                          Icons.favorite_border,
                          color: Colors.grey,
                        ),
                ),
              ],
            ),
            Image.network(
              product.image,
              height: 120,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(product.title.substring(0, 18)),
          ],
        ),
      ),
    );
  }
}
