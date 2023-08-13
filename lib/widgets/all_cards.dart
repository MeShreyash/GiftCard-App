import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pages/card_page.dart';
import '../providers/card_providers.dart';
import '../providers/category_provider.dart';

class AllCardGrid extends ConsumerWidget {
  const AllCardGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardList = ref.watch(cardListProvider.notifier).state;
    final selectedCategory = ref.watch(selectedCategoryProvider.notifier).state;

    // Filter the cards based on the selected category
    final filteredCards = selectedCategory == null
        ? cardList
        : cardList.where((card) => card.category == selectedCategory).toList();

    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: filteredCards.length,
      itemBuilder: (context, index) {
        final card = filteredCards[index];
        return SquareCard(
          title: card.name,
          textColor: card.textColor,
          imageAddress: card.imageUrl,
          color: card.cardColor,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CardPage(selectedCard: card),
              ),
            );
          },
        );
      },
    );
  }
}

class SquareCard extends StatelessWidget {
  final String imageAddress;
  final String title;
  final Color color;
  final Color textColor;
  final Function() onTap;

  const SquareCard({
    super.key,
    required this.title,
    required this.imageAddress,
    required this.color,
    required this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: color,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          width: 110,
          height: 110,
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Image.asset(
                  imageAddress,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
