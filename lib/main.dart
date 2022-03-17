import 'package:flutter/services.dart';
import 'package:shopping_api_gdsc/Product/product-class.dart';
import 'package:flutter/material.dart';
import 'package:shopping_api_gdsc/parse_json.dart';
import 'package:shopping_api_gdsc/profileAvatar.dart';
import 'package:shopping_api_gdsc/upper.dart';

void main() => runApp(
      const MyApp(),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Product>> futureAlbum;

  @override
  void initState() {
    futureAlbum = fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDCF0F9),
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 6.0),
          child: IconButton(
            icon: const Icon(
              Icons.sort,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ),
        actions: [
          profileAvatar,
        ],
      ),
      body: Column(
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
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 5,
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
      ),

    );
  }

  Widget _buildProducts(Product e) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text("\$"),
                  Text(e.price),
                ],
              ),
              const Icon(
                Icons.favorite_border,
                color: Colors.grey,
              ),
            ],
          ),
          Image.network(
            e.image,
            height: 120,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(e.title.substring(0, 18)),
        ],
      ),
    );
  }
}
