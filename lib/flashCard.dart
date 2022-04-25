import 'package:flutter/material.dart';

class FlashCard {
  late final String title;
  late final String description;

  FlashCard({required this.title, required this.description});
}

List<FlashCard> flashCardRepo = [
  FlashCard(title: 'title 1', description: 'this is first description and is long . it should not overflow and cause error'),
  FlashCard(title: 'title 2', description: 'description 2'),
  FlashCard(title: 'title 3', description: 'description 3'),
  FlashCard(title: 'title 4', description: 'description 4'),
  FlashCard(title: 'title 5', description: 'description 5'),
  FlashCard(title: 'title 6', description: 'description 6'),
];
