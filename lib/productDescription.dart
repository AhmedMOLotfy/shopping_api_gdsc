import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_api_gdsc/Product/product-class.dart';
import 'package:shopping_api_gdsc/appState.dart';

class ProductDescription extends StatefulWidget {
  final Product product;
  const ProductDescription({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  late double price = double.parse(widget.product.price) + 20;
  String dropDownValueQTY = '1';

  var itemsQTY = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];

  String dropDownValueColor = 'blue';

  var itemsColor = [
    'blue',
    'green',
    'yellow',
    'red',
    'black',
  ];

  String dropDownValueSize = '40';

  var itemsSize = [
    '42',
    '41',
    '40',
    '39',
    '38',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDCF0F9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(top: 6, right: 6, bottom: 6),
          child: IconButton(
            icon: const CircleAvatar(
              backgroundColor: Color(0xFF08D8E1),
              child: Padding(
                padding: EdgeInsets.only(left: 2.0),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 14,
                  color: Colors.white,
                ),
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 25, top: 2),
            child: CircleAvatar(
              backgroundImage: AssetImage("images/avatar.png"),
            ),
          ),
        ],
      ),
      body: ListView(children: [
        SizedBox(
          height: 700,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top:3.0,left: 8,bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      capitalize("Nike"),
                      style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF323b5a),
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(widget.product.title,
                        style: const TextStyle(
                            fontSize: 25,
                            color: Color(0xFF323b5a),
                            fontWeight: FontWeight.w600)),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      capitalize(widget.product.category),
                      style: const TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          //TODO: Add Box Shadow here
                          height: 140,

                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 80),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          child: Image.network(
                            widget.product.image,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(

                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFFedf6fb),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Description",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color(0xFF323b5a)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(
                            widget.product.description,
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Colors.grey[500]),
                          ),
                        ),
                        const SizedBox(
                          height: 19,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 15,
                              color: Color(0xFF08D8E1),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              "Retail Price",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF323b5a)),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            const Text(
                              "\$",
                              style: TextStyle(
                                  color: Color(0xFF08D8E1),
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.product.price.toString(),
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 15,
                              color: Color(0xFF08D8E1),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              "Est. Resell price",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(
                                  0xFF323b5a,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            const Text(
                              "\$",
                              style: TextStyle(
                                color: Color(0xFF08D8E1),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              widget.product.price.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(" - "),
                            Text(
                              "${price.round()}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                decoration: BoxDecoration(
                                    color: const Color(0xFFbff0f5),
                                    borderRadius: BorderRadius.circular(12)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        const Text(
                                          "Size",
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        DropdownButton<String>(
                                          value: dropDownValueSize,
                                          underline:
                                          Container(color: Colors.transparent),
                                          icon: const Icon(
                                            Icons.keyboard_arrow_down,
                                            color: Color(0xFF08D8E1),
                                          ),
                                          items: itemsSize.map((String items) {
                                            return DropdownMenuItem(
                                              value: items,
                                              child: Text(
                                                items,
                                                style: const TextStyle(
                                                    color: Color(0xFF323b5a),
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              dropDownValueSize = newValue!;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        const Text(
                                          "Color",
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        DropdownButton<String>(
                                          value: dropDownValueColor,
                                          underline:
                                          Container(color: Colors.transparent),
                                          icon: const Icon(
                                            Icons.keyboard_arrow_down,
                                            color: Color(0xFF08D8E1),
                                          ),
                                          items: itemsColor.map((String items) {
                                            return DropdownMenuItem(
                                              value: items,
                                              child: Text(
                                                items,
                                                style: const TextStyle(
                                                    color: Color(0xFF323b5a),
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              dropDownValueColor = newValue!;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        const Text(
                                          "QTY",
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        DropdownButton<String>(
                                          value: dropDownValueQTY,
                                          underline:
                                          Container(color: Colors.transparent),
                                          icon: const Icon(
                                            Icons.keyboard_arrow_down,
                                            color: Color(0xFF08D8E1),
                                          ),
                                          items: itemsQTY.map((String items) {
                                            return DropdownMenuItem(
                                              value: items,
                                              child: Text(
                                                items,
                                                style: const TextStyle(
                                                    color: Color(0xFF323b5a),
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              dropDownValueQTY = newValue!;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 1.3,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(18.0),
                                        )),
                                    // padding: MaterialStateProperty.resolveWith((states) => const EdgeInsets.symmetric(horizontal: 100,vertical: 2)),
                                    backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                          (states) => const Color(
                                        0xFF08D8E1,
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    Provider.of<CartModel>(context, listen: false).add(widget.product);
                                    Provider.of<CartModel>(context, listen: false).printItems();

                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        "Add To Bag",
                                      ),
                                      SizedBox(width: 25,),
                                      Icon(Icons.add_shopping_cart)
                                    ],
                                  )),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],),
    );
  }

  String capitalize(String string) {
    if (string.isEmpty) {
      return string;
    }

    return string[0].toUpperCase() + string.substring(1);
  }
}
