import 'package:cloud_firestore/cloud_firestore.dart';
import '../database.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;


class AddFlashCardScreen extends StatefulWidget {
  late final String flashCardId;
  AddFlashCardScreen({Key? key,required this.flashCardId}) : super(key: key);

  @override
  State<AddFlashCardScreen> createState() {
    return _AddFlashCardScreenState();
  }
}

class _AddFlashCardScreenState extends State<AddFlashCardScreen> {
  final formkey = GlobalKey<FormState>();

  DatabaseService databaseService = DatabaseService();

  final tittleTextController = TextEditingController();
  final descriptionTextController = TextEditingController();

  bool isLoading = false;
  String title = "", description = "";

  void createRemoteFlashCard() {}

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Create Flash Card',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.lightBlueAccent,
                    fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (val)=>val!.isEmpty? 'Title':null,
                  controller: tittleTextController,
                  maxLines: 1,
                  decoration: InputDecoration(
                    label: Text(
                      'Enter Title',
                      textAlign: TextAlign.center,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(16)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.blueAccent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(16)),
                  ),

                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: TextFormField(
                  validator: (val)=>val!.isEmpty? 'Description':null,
                  controller: descriptionTextController,
                  decoration: InputDecoration(
                      label: Text(
                        'Enter Description',
                        textAlign: TextAlign.center,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(16)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.blueAccent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(16)),
                      filled: true,
                      fillColor: Colors.grey.shade50),
                  maxLines: 6,


                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  borderRadius: BorderRadius.circular(16),
                  child: MaterialButton(
                      height: 40,
                      minWidth: 100,
                      color: Colors.purple,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'ADD',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//              TextField(
//                 onChanged: (value) {
//                   title = value;
//                 },
//               ),
//               TextField(
//                 maxLines: 10,
//                 decoration: InputDecoration(
//                   hintText: 'Enter Description here'
//                 ),
//                 onChanged: (value) {
//                   description = value;
//                 },
//               ),
