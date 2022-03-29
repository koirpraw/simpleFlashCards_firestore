
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizard/categoryScreen.dart';
import 'package:quizard/flashcardsscreen.dart';




class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CategoryScreen(),
    );
  }
}



