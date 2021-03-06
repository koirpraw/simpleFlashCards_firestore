import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:quizard/screens/json_flashcardScreen.dart';
import 'package:quizard/screens/local_flashcardScreen.dart';
import 'package:quizard/screens/readJson.dart';
import 'package:quizard/screens/temp_json_cards.dart';
import 'screens/homepage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
      // MyJsonApp(),

      getPages: [
        GetPage(name: '/localfilesource', page: ()=>LocalFileFlashCardScreen()),
        GetPage(name: '/readjson', page: ()=>ReadJson()),
        GetPage(name: '/localjsonsource', page: ()=>LocalJsonFlashCardScreen()),
        GetPage(name: '/tempjson', page: ()=>TempJsonCards())
      ],
    );
  }
}


