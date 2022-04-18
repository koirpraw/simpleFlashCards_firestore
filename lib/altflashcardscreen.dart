import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

class AltFlashCardScreen extends StatefulWidget {
  const AltFlashCardScreen({Key? key}) : super(key: key);

  @override
  State<AltFlashCardScreen> createState() => _AltFlashCardScreenState();
}

class _AltFlashCardScreenState extends State<AltFlashCardScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("alt Flash Cards"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("1/20", style: TextStyle(fontSize: 32),)
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width * 0.85,
                child: FlipCard(
                  front: Card(
                    elevation: 6,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Dog breed, Mix Breed of Golden retriver and poodle. ",
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                  back: Card(
                      elevation: 4,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Golden Doodle",
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
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
                      onPressed: () {},
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
                      onPressed: () {},
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
}
