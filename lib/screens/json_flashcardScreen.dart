import 'dart:convert';

import 'package:quizard/model/flashcardJson.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/services.dart';
import 'package:quizard/flashCard.dart';
import 'package:get/get.dart';
import '../flashCard.dart';

class LocalJsonFlashCardScreen extends StatefulWidget {
  const LocalJsonFlashCardScreen({Key? key}) : super(key: key);

  @override
  State<LocalJsonFlashCardScreen> createState() =>
      _LocalJsonFlashCardScreenState();
}

class _LocalJsonFlashCardScreenState extends State<LocalJsonFlashCardScreen> {
  int currentCardIndex = 0;


  List _flashcards = [];

  Future<void> readJson() async {
    final String response =
    await rootBundle.loadString('assets/json/sample_flashcards.json');
    final data = await json.decode(response);
    setState(() {
      _flashcards = data["flashcards"];
    });
  }


  @override
  Widget build(BuildContext context) {
    // String value = (initial*6).toStringAsFixed(0);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Json Flash Cards"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.close_rounded,
                  color: Colors.white,
                ))
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Card ${currentCardIndex+1} of ${_flashcards.length}",style: TextStyle(fontSize: 24),),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.75,
                    child: LinearProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.deepOrange),
                      value: currentCardIndex.toDouble()/(_flashcards.length-1),
                      minHeight: 20,
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: FutureBuilder(
                      future: readJson(), builder: (context, snapshot) {
                    return Builder(
                        builder: (BuildContext context) {
                          return Container(

                            width: MediaQuery.of(context).size.width*0.8,
                            height: MediaQuery.of(context).size.height*0.6,
                            child: FlipCard(
                                front: Card(
                                  elevation: 6,
                                  shadowColor: Colors.blueGrey,
                                  child: Center(
                                    child: Text(_flashcards[currentCardIndex]['title']),
                                  ),
                                ),
                                back: Card(
                                  elevation: 6,
                                  shadowColor: Colors.blueGrey,
                                  child: Center(
                                    child: Text(_flashcards[currentCardIndex]['description']),
                                  ),
                                )),
                          );

                        });
                  }),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.white)
                        ),
                          onPressed: (){
                        showPreviousCard();
                      }, child: Icon(Icons.arrow_back_rounded,color: Colors.lightGreen,)),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.white)
                          ),
                          onPressed: (){
                        showNextCard();
                      }, child: Icon(Icons.arrow_forward_rounded,color: Colors.lightGreen)
                      )],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


  void showNextCard() {
    setState(() {
      currentCardIndex = (currentCardIndex + 1 < flashCardRepo.length)
          ? currentCardIndex + 1
          : 0;
    });
  }

  void showPreviousCard() {
    setState(() {
      currentCardIndex = (currentCardIndex - 1 >= 0)
          ? currentCardIndex - 1
          : flashCardRepo.length - 1;
    });
  }
}


