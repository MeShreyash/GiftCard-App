import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/card_model.dart';

// Provider to store the list of cards
final cardListProvider =
    StateProvider<List<CardModel>>((ref) => CardModel.cardList);

// Provider to store the receiver's name
final receiverNameProvider = StateProvider<String>((ref) => "");

// Provider to store the amount
final amountProvider = StateProvider<int>((ref) => 0);
