import 'package:flutter/material.dart';
import 'package:shopping_api_gdsc/forms.dart';

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
      child: textField,
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