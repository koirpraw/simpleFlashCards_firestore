import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'addflashcardScreen.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

class FlashCardsScreen extends StatefulWidget {
   FlashCardsScreen({Key? key}) : super(key: key);

  late final String title;

  late String description;

  @override
  State<FlashCardsScreen> createState() => _FlashCardsScreenState();
}

class _FlashCardsScreenState extends State<FlashCardsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category'),
      ),
      backgroundColor: Colors.white,
      body: NotesStream(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () => showModalBottomSheet(
          context: context,
          builder: (context) => SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.4,
                child: AddFlashCardScreen(flashCardId: '',),
              ),
            ),
          ),
        ),
        child: Icon(
          Icons.add,
          color: Colors.blue,
        ),
      ),
    );
  }
}

class NotesStream extends StatelessWidget {
  const NotesStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: firestore.collection('demoFlashCards').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator(
              backgroundColor: Colors.lightBlue,
            );
          }
          final flashcards = snapshot.data?.docs;

          List<FlashCardContainer> flashcardcontainers = [];

          for (var flashcard in flashcards!) {
            final contentTitle = flashcard['title'];
            final contentDescription = flashcard['description'];

            final flashcardcontainer = FlashCardContainer(
                title: contentTitle, description: contentDescription);
            flashcardcontainers.add(flashcardcontainer);
          }
          return ListView(
            reverse: false,
            children: flashcardcontainers,
          );
        });
  }
}

class FlashCardContainer extends StatefulWidget {
  const FlashCardContainer(
      {Key? key, required this.title, required this.description})
      : super(key: key);

  final String title;
  final String description;

  @override
  State<FlashCardContainer> createState() => _FlashCardContainerState();
}

class _FlashCardContainerState extends State<FlashCardContainer> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Material(
        color: Colors.transparent,
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height*0.25,
          decoration: BoxDecoration(
            color: Color(0xFFEEEEEE),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.title,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        widget.description,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        maxLines: 8,

                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}