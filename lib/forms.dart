import 'package:flutter/material.dart';

TextField textField = TextField(
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