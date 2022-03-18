import 'package:flutter/material.dart';

class MyBag extends StatefulWidget {
  const MyBag({Key? key}) : super(key: key);

  @override
  State<MyBag> createState() => _MyBagState();
}

class _MyBagState extends State<MyBag> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
                fontSize: 15, color: Colors.grey, fontWeight: FontWeight.w400),
          ),
        ),
        //https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(12),
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
                          children: const [
                            Text(
                              "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
                              softWrap: true,
                            ),
                            Text("120\$")
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Image.network(
                              "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg"))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
