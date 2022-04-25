import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:quizard/flashCard.dart';
import 'package:get/get.dart';
import '../flashCard.dart';

// final FirebaseFirestore firestore = FirebaseFirestore.instance;
// FlashCard flashCard = FlashCard(title: '', description: '',);

class LocalFileFlashCardScreen extends StatefulWidget {
  const LocalFileFlashCardScreen({Key? key}) : super(key: key);

  @override
  State<LocalFileFlashCardScreen> createState() =>
      _LocalFileFlashCardScreenState();
}

class _LocalFileFlashCardScreenState extends State<LocalFileFlashCardScreen> {
  int currentCardIndex = 0;
  late double initial = 1;

  @override
  Widget build(BuildContext context) {
    // String value = (initial*6).toStringAsFixed(0);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("alt Flash Cards"),
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
                  value:
                      currentCardIndex.toDouble() / (flashCardRepo.length - 1),
                  backgroundColor: Colors.grey.shade300,
                  minHeight: 20,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width * 0.85,
                child: FlipCard(
                  front: Card(
                    elevation: 6,
                    child: Center(
                      child: Text(
                        "${flashCardRepo[currentCardIndex].title} ",
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  back: Card(
                      elevation: 4,
                      child: Center(
                        child: Text(
                          "${flashCardRepo[currentCardIndex].description}",
                          overflow: TextOverflow.ellipsis,
                        ),
                      )),
                ),
              ),
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

  void endOfCard() {
    if (currentCardIndex >= flashCardRepo.length + 1) {
      setState(() {
        currentCardIndex = 0;
        initial = 0.1;
      });
    }
  }

  // void updateToNext(){
  //   setState(() {
  //     initial = initial +1;
  //     if(initial> flashCardRepo.length+1){
  //       initial = 1;
  //     }
  //   });
  // }
  //
  // void updateToPrev(){
  //   setState(() {
  //     initial = initial -1;
  //     if(initial < flashCardRepo.length+1){
  //       initial = flashCardRepo.length+1;
  //     }
  //   });
  // }

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
