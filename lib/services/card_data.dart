import 'package:flutter/cupertino.dart';
import 'package:visiting_card/models/card_model.dart';

class CardData with ChangeNotifier {
  List<VisitingCard> cards = [];

  void addNewCard(VisitingCard card) {

    cards.add(card);
    notifyListeners();
  }
  void deleteCard(VisitingCard card){
    cards.remove(card);
    notifyListeners();
  }
}
