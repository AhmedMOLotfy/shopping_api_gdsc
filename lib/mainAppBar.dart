import 'package:flutter/material.dart';

Padding profileAvatar =  const Padding(
  padding: EdgeInsets.only(right: 25, top: 2),
  child: CircleAvatar(
    backgroundImage: AssetImage("images/avatar.png"),
  ),
);

AppBar mainAppBar = AppBar(
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
);