import 'package:flutter/material.dart';

class CardModel {
  final int id;
  final String name;
  final String imageUrl;
  final Color textColor;
  final Color cardColor;
  final String category;

  CardModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.textColor,
    required this.cardColor,
    required this.category,
  });

  CardModel copyWith({
    int? id,
    String? name,
    String? imageUrl,
    Color? textColor,
    Color? cardColor,
    String? category,
  }) {
    return CardModel(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      textColor: textColor ?? this.textColor,
      cardColor: cardColor ?? this.cardColor,
      category: category ?? this.category,
    );
  }

  static List<CardModel> cardList = [
    CardModel(
      id: 1,
      name: 'Netflix',
      imageUrl: 'assets/images/netflix.png',
      textColor: Colors.red,
      cardColor: Colors.black,
      category: 'Movies',
    ),
    CardModel(
      id: 2,
      name: 'Prime',
      imageUrl: 'assets/images/prime.png',
      textColor: Colors.black,
      cardColor: Colors.white,
      category: 'Movies',
    ),
    CardModel(
      id: 3,
      name: 'Spotify',
      imageUrl: 'assets/images/spotify.png',
      textColor: Colors.white,
      cardColor: Colors.green,
      category: 'Music',
    ),
    CardModel(
      id: 4,
      name: 'Amazon',
      imageUrl: 'assets/images/amazon.png',
      textColor: Colors.amber,
      cardColor: Colors.black,
      category: 'Shopping',
    ),
    CardModel(
      id: 5,
      name: 'Walmart',
      imageUrl: 'assets/images/walmart.png',
      textColor: Colors.black,
      cardColor: Colors.amberAccent,
      category: 'Shopping',
    ),
    CardModel(
      id: 6,
      name: 'Hotstar',
      imageUrl: 'assets/images/hotstar.png',
      textColor: Colors.white,
      cardColor: Colors.indigo,
      category: 'Movies',
    ),
    CardModel(
      id: 7,
      name: 'Google Play Games',
      imageUrl: 'assets/images/googleplay.png',
      textColor: Colors.black,
      cardColor: Colors.white,
      category: 'Games',
    ),
    CardModel(
      id: 8,
      name: 'Myntra',
      imageUrl: 'assets/images/myntra.png',
      textColor: Colors.white,
      cardColor: Colors.pink,
      category: 'Shopping',
    ),
    CardModel(
      id: 9,
      name: 'iTunes',
      imageUrl: 'assets/images/itunes.png',
      textColor: Colors.white,
      cardColor: Colors.black,
      category: 'Music',
    ),
  ];
}
