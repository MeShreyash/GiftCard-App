import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/category_provider.dart';
import '../widgets/all_cards.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(selectedCategoryProvider);
    final categories = ref.watch(categoryListProvider.notifier).state;
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        title: const Text(
          'Gift Card App',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              //HEading 1
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Shop Gift Cards for',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
              //Vertical category cards
              Row(
                children: [
                  RotatedBox(
                    quarterTurns: -1,
                    child: Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.grey[850],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: categories
                        .map(
                          (category) => GestureDetector(
                            onTap: () {
                              final categoryProvider =
                                  ref.read(selectedCategoryProvider.notifier);

                              categoryProvider.state =
                                  categoryProvider.state == category.name
                                      ? null
                                      : category.name;
                            },
                            child: SizedBox(
                              height: 200,
                              width: 70,
                              child: Card(
                                elevation:
                                    selectedCategory == category.name ? 8 : 0,
                                color: selectedCategory == category.name
                                    ? category.color.withOpacity(0.75)
                                    : category.color,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        category.icon,
                                        color: Colors.white,
                                      ),
                                      if (selectedCategory == category.name)
                                        Icon(
                                          Icons.done_rounded,
                                          color: Colors.white,
                                        ),
                                      RotatedBox(
                                        quarterTurns: -1,
                                        child: Text(
                                          category.name,
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),

              //heading 2
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'All  Gift Cards',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
              //square cards
              AllCardGrid(),
            ],
          ),
        ),
      ),
    );
  }
}
