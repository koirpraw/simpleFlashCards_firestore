import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quizard/database.dart';
import 'package:quizard/screens/remote_flashcardScreen.dart';

import 'addflashcardScreen.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

class CategoryScreen extends StatelessWidget {
   CategoryScreen({Key? key}) : super(key: key);




   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flash cards'),
        ),
        body: CategoryStream(),
      ),
    );
  }
}

class CategoryStream extends StatelessWidget {
  const CategoryStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: firestore.collection('flashcards').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator(
              backgroundColor: Colors.lightBlue,
            );
          }
          final flashcards = snapshot.data?.docs;

          List<CategoryContainer> categorycontainers = [];

          for (var flashcard in flashcards!) {
            final categoryTitle = flashcard['categoryTitle'];
            final categoryImageUrl = flashcard['imageUrl'];
            final categoryIsLiked = flashcard['isLiked'];

            final categorycontainer = CategoryContainer(
              title: categoryTitle,
              imageUrl: categoryImageUrl,
              isLiked: false,
            );
            categorycontainers.add(categorycontainer);
          }
          return ListView(
            reverse: false,
            children: categorycontainers,
          );
        });
  }
}

class CategoryContainer extends StatefulWidget {
  CategoryContainer(
      {Key? key,
      required this.title,
      required this.imageUrl,
      required this.isLiked})
      : super(key: key);

  final String title;
  final String imageUrl;
  bool isLiked = false;



  @override
  State<CategoryContainer> createState() => _CategoryContainerState();
}

class _CategoryContainerState extends State<CategoryContainer> {
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
        child: GestureDetector(
          onTap: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=>FlashCardsScreen()));
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.25,
            decoration: BoxDecoration(
              color: Color(0xFFEEEEEE),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      '${widget.imageUrl}',
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.25,
                      fit: BoxFit.fitWidth,
                    )),
                Positioned(
                  left: 150,
                  bottom: 100,
                  child: Text(
                    '${widget.title}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Positioned(
                    right: 25,
                    top: 10,
                    child: IconButton(

                        icon: widget.isLiked? Icon(Icons.favorite_rounded,color: Colors.red,size: 36,):Icon(Icons.favorite_border_rounded,color: Colors.white,size: 24,),
                        onPressed: () {
                          widget.isLiked = true;
                setState(() {

                });
                },
                    )
                ),
                    ],
            ),
          ),
        ),
      ),
    );
  }
}
