import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:shopping_api_gdsc/appState.dart';

import 'Product/product-class.dart';

class MyBag extends StatefulWidget {
  const MyBag({Key? key}) : super(key: key);

  @override
  State<MyBag> createState() => _MyBagState();
}

class _MyBagState extends State<MyBag> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
      builder: (context, cart, child) {
        return ListView(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20.0, left: 20),
              child: Text(
                "My Bag",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF323b5a),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 7.0, left: 20),
              child: Text(
                "Check and Pay Your Purchases",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Column(
              children: cart.items.map((e) => ConsumerBag(product: e)).toList(),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(cart.myItems.length.toString()),
                            Text(" Item(s)")
                          ],
                        ),
                        Row(
                          children: [
                            Text("\$"),
                            Text(cart.totalPrice.ceilToDouble().toString()),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}

class ConsumerBag extends StatelessWidget {
  final Product product;
  const ConsumerBag({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              Provider.of<CartModel>(context, listen: false)
                  .removeItem(product);
            },
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          )
        ],
      ),
      child: Container(
        margin: const EdgeInsets.all(7),
        child: Container(
          width: double.infinity,
          height: 90,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25.0),
          ),
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.title,
                        softWrap: true,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF323b5a))),
                    Row(
                      children: [
                        Text(
                          product.price.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF323b5a)),
                        ),
                        const Text(
                          "\$",
                          style: TextStyle(
                              color: Color(0xFF08D8E1),
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Expanded(flex: 1, child: Image.network(product.image))
            ],
          ),
        ),
      ),
    );
  }
}
