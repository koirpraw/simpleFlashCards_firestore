class FlashCardModel {
  List<Flashcards>? flashcards;

  FlashCardModel({this.flashcards});

  FlashCardModel.fromJson(Map<String, dynamic> json) {
    if (json['flashcards'] != null) {
      flashcards = <Flashcards>[];
      json['flashcards'].forEach((v) {
        flashcards!.add(new Flashcards.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.flashcards != null) {
      data['flashcards'] = this.flashcards!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Flashcards {
  String? title;
  String? description;

  Flashcards({this.title, this.description});

  Flashcards.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    return data;
  }
}
