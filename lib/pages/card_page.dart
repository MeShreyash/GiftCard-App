import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/card_model.dart';
import '../providers/card_providers.dart';

class CardPage extends ConsumerWidget {
  final CardModel selectedCard;
  const CardPage({required this.selectedCard, super.key});

  void onNameSubmit(WidgetRef ref, String name) {
    ref.read(receiverNameProvider.notifier).update((state) => name);
  }

  void onAmountSubmit(WidgetRef ref, String amount) {
    ref.read(amountProvider.notifier).update((state) => int.parse(amount));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCardReceiverName = ref.watch(receiverNameProvider);
    final selectedCardAmount = ref.watch(amountProvider);
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            )),
        title: const Text(
          'Buy gift card',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //Gift card
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  color: selectedCard.cardColor,
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            bottomLeft: Radius.circular(16.0),
                          ),
                          child: Image.asset(
                            selectedCard.imageUrl,
                            fit: BoxFit.contain,
                            height: 80,
                            width: 100,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 200,
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'E-Gift Card',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: selectedCard.textColor,
                                ),
                              ),
                              const SizedBox(height: 80.0),
                              Text(
                                '${selectedCardReceiverName}',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: selectedCard.textColor,
                                ),
                              ),
                              Text(
                                '\$${selectedCardAmount}',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: selectedCard.textColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //Txt field to input reciever's name
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextField(
                    onSubmitted: (value) => onNameSubmit(ref, value),
                    style: TextStyle(fontSize: 18.0),
                    decoration: InputDecoration(
                      labelText: "Enter Receiver's Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 2.0,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextField(
                    onSubmitted: (value) => onAmountSubmit(ref, value),
                    style: const TextStyle(fontSize: 18.0),
                    decoration: InputDecoration(
                      labelText: "Enter Amount",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 2.0,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
            ],
          ),
          //Button
          Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 250,
                height: 55,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary:
                        Colors.pink, // Set the button background color to pink
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                  ),
                  icon: const Icon(
                    Icons.share_rounded,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Send This',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
