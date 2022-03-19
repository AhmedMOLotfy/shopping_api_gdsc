import 'package:flutter/material.dart';


TextField searchEngine = TextField(
  decoration: InputDecoration(
    suffixIcon: Container(
      margin: const EdgeInsets.only(
          top: 5, right: 5, bottom: 5),
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        color: Color(0xFF08D8E1),
        shape: BoxShape.circle,

      ),
      child: const Icon(
        Icons.search_sharp,
        size: 20,
        color: Colors.white,
      ),
    ),
    fillColor: Colors.white,
    filled: true,
    constraints: const BoxConstraints(
      maxHeight: 41,
      maxWidth: 370,
    ),
    contentPadding: const EdgeInsets.all(15),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
          color: Colors.white, width: 2.0),
      borderRadius: BorderRadius.circular(25.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
          color: Colors.white, width: 2.0),
      borderRadius: BorderRadius.circular(25.0),
    ),
    hintStyle:
    TextStyle(color: Colors.grey[500], fontSize: 14),
    hintText: "Find shoes",
  ),
);

Widget textButton(String text, Color color) {
  return TextButton(
    onPressed: () {},
    child: Text(
      text,
      style: TextStyle(
        color: color,
      ),
    ),
  );
}
Column columnUpper = Column(
  children: [
    Padding(
      padding: const EdgeInsets.only(top: 30.0),

      /// This is text Field
      child: searchEngine,
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        Padding(
          padding: EdgeInsets.only(top: 20.0, left: 20),
          child: Text(
            "Categories",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color(0xFF323b5a),
            ),
          ),
        )
      ],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        textButton("Nike", Colors.black),
        textButton("Adidas", Colors.grey),
        textButton("Puma", Colors.grey),
        textButton("Balenciaega", Colors.grey),
        textButton("Converse", Colors.grey),
      ],
    ),
  ],
);