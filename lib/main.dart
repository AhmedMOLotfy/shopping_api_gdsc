import 'package:flutter/material.dart';
import 'package:shopping_api_gdsc/MainBody.dart';
import 'package:shopping_api_gdsc/mainAppBar.dart';
import 'package:shopping_api_gdsc/MyBag.dart';
import 'package:provider/provider.dart';

import 'package:shopping_api_gdsc/appState.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => CartModel(),
        )
      ],
      child: const MyApp(),
    ));

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
  int _selectedIndex = 0;
  List<Widget> pages = [
    const MainBody(),
    const Text(""),
    const Text(""),
    const MyBag(),
    const Text("")
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDCF0F9),
      appBar: mainAppBar,
      body: pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.blue,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.chat_bubble_outline,
              ),
              label: ''),
          //Icon(
          //   Icons.local_grocery_store,
          // ),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.perm_identity,
              ),
              label: ''),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: const Color(0xFF08D8E1),
      ),
    );
  }
}
