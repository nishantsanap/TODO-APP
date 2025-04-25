import 'package:flutter/material.dart';
import 'package:my_app/homepage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(), //call homepage
      debugShowCheckedModeBanner: false,
     // theme: ThemeData(primarySwatch: Colors.blueAccent),


    );
  }
}