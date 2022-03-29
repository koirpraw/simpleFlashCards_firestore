import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  // final String uid;
  //
  // DatabaseService({required this.uid});

  Future<void> addCategory(flashCardData, String flashCardId) async {
    await FirebaseFirestore.instance
        .collection("flashcards")
        .doc(flashCardId)
        .set(flashCardData)
        .catchError((e) {
      print(e);
    });
  }
}

Future<void> addFlashCardContent(flashCardData, String flashCardId) async {
  await FirebaseFirestore.instance
      .collection('flashcards')
      .doc(flashCardId)
      .collection('Categories')
      .add(flashCardData)
      .catchError((e) {
    print(e);
  });
}
