import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardCategory {
  final String name;
  final IconData icon;
  final Color color;
  CardCategory({
    required this.name,
    required this.icon,
    required this.color,
  });
}

final categoryListProvider = StateProvider((ref) {
  return [
    CardCategory(
      name: 'Music',
      icon: Icons.music_note_rounded,
      color: Colors.deepPurpleAccent,
    ),
    CardCategory(
      name: 'Movies',
      icon: Icons.local_movies_rounded,
      color: Colors.redAccent,
    ),
    CardCategory(
      name: 'Games',
      icon: Icons.videogame_asset_rounded,
      color: Colors.green,
    ),
    CardCategory(
      name: 'Shopping',
      icon: Icons.shopify_rounded,
      color: Colors.deepOrange,
    )
  ];
});

final selectedCategoryProvider = StateProvider<String?>((ref) => null);
