import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizard/screens/local_flashcardScreen.dart';
import 'package:quizard/screens/categoryScreen.dart';
import 'package:quizard/screens/remote_flashcardScreen.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flash Cards "),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Flash Card view using contents from different sources")
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed('/localfilesource');
                }, child: Text("Local dart file list")),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed('/readjson');
                }, child: Text("Read Json")),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed('/localjsonsource');
                }, child: Text("Local: Json file")),
            // ElevatedButton(
            //     onPressed: () {
            //       Get.toNamed('/tempjson');
            //     }, child: Text("Temp: Json Card")),
            ElevatedButton(
                onPressed: () {}, child: Text("Remote: Firebase Firestore")),
            ElevatedButton(
                onPressed: () {}, child: Text("Remote: API call(API endpoints)")),
          ],
        ),
      ),
      // CategoryScreen(),
    );
  }
}
