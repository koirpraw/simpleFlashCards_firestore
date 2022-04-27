import 'dart:convert';

import 'package:quizard/model/flashcardJson.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/services.dart';
import 'package:quizard/flashCard.dart';
import 'package:get/get.dart';
import '../flashCard.dart';

class TempJsonCards extends StatefulWidget {
  const TempJsonCards({Key? key}) : super(key: key);

  @override
  State<TempJsonCards> createState() => _TempJsonCardsState();
}

class _TempJsonCardsState extends State<TempJsonCards> {
  // int currentCardIndex = 0;
  // late double initial = 1;
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

  //
  // Future<void> readJson() async {
  //   final String response =
  //       await rootBundle.loadString('assets/json/sample_flashcards.json');
  //   final data = await jsonDecode(response);
  //   setState(() {
  //     myList = data['flashcards'];
  //   });
  // }

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${currentCardIndex + 1}/${flashCardRepo.length}",
                    style: TextStyle(fontSize: 22),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: LinearProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.green),
                  value: currentCardIndex.toDouble()/(_flashcards.length-1),
                  backgroundColor: Colors.grey.shade300,
                  minHeight: 20,
                ),
              ),
              FutureBuilder(
                  future: readJson(),
                  builder: (context, snapshot) {
                    return Builder(

                       builder: (BuildContext context) {
                          return Container(
                            height: 300,
                            width: 300,
                            child: FlipCard(
                              front: Card(
                                child: Center(
                                  child: Text(_flashcards[currentCardIndex]["title"]),
                                ),
                              ),
                              back: Card(
                                child: Center(
                                  child: Text(_flashcards[currentCardIndex]["description"]),
                                ),
                              ),
                            ),
                          );
                        });
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(Colors.white)),
                      onPressed: () {
                        showPreviousCard();
                        // updateToPrev();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Icon(
                            Icons.chevron_left_rounded,
                            color: Colors.blue,
                          ),
                          Text(
                            "Previous",
                            style: TextStyle(color: Colors.black54),
                          )
                        ],
                      )),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(Colors.white)),
                      onPressed: () {
                        showNextCard();
                        // updateToNext();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text(
                            "Next",
                            style: TextStyle(color: Colors.black54),
                          ),
                          Icon(
                            Icons.chevron_right_rounded,
                            color: Colors.blue,
                          ),
                        ],
                      )),
                ],
              )
            ],

          ),
        ),
      ),
    );
  }
  void showNextCard() {
    setState(() {
      currentCardIndex = (currentCardIndex + 1 < _flashcards.length)
          ? currentCardIndex + 1
          : 0;
    });
  }

  void showPreviousCard() {
    setState(() {
      currentCardIndex = (currentCardIndex - 1 >= 0)
          ? currentCardIndex - 1
          : _flashcards.length - 1;
    });
  }
}

//   void endOfCard() {
//     if (currentCardIndex >= flashCardRepo.length + 1) {
//       setState(() {
//         currentCardIndex = 0;
//         initial = 0.1;
//       });
//     }
//   }
//

