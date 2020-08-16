import 'package:flutter/cupertino.dart';
import 'package:visiting_card/models/card_model.dart';
import 'package:visiting_card/services/card_db.dart';

class CardData with ChangeNotifier {
  List<VisitingCard> cards = [];
  VisitingCardDatabase visitingCardDatabase = VisitingCardDatabase();

  void getVisitingCards() async{
    await visitingCardDatabase.getAllVisitingCards().then((value) {
      cards = value;
      notifyListeners();
    });
  }

  Future<void> addNewCard(VisitingCard card) async{
    await visitingCardDatabase.addToBox(card);

    getVisitingCards();
  }

  Future<void> deleteCard(int index) async{
    await visitingCardDatabase.deleteFromBox(index);
    getVisitingCards();
  }

  Future<void> updateCard(int index, VisitingCard visitingCard)async{
    await visitingCardDatabase.updateVisitingCard(index, visitingCard);
  }
}
