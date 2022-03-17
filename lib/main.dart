import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:shopping_api_gdsc/profileAvatar.dart';
import 'package:shopping_api_gdsc/MainBody.dart';

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
      body: const MainBody(),

    );
  }
}





