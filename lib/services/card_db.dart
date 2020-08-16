import 'package:hive/hive.dart';
import 'dart:async';
import 'package:visiting_card/models/card_model.dart';

class VisitingCardDatabase {
  String _boxName = "card";

  Future<Box> visitingCardBox() async {
    var box = await Hive.openBox<VisitingCard>(_boxName);
    return box;
  }

  Future<List<VisitingCard>> getAllVisitingCards() async {
    final box = await visitingCardBox();
    List<VisitingCard> visitingCard = box.values.toList();
    return visitingCard;
  }

  Future<int> addToBox(VisitingCard visitingCard) async {
    final box = await visitingCardBox();

    var a = await box.add(visitingCard);
    return a;
  }

  Future<void> deleteFromBox(int index) async {
    final box = await visitingCardBox();
    await box.deleteAt(index);
  }

  Future<void> deleteAll() async {
    final box = await visitingCardBox();
    await box.clear();
  }

  Future<void> updateVisitingCard(int index, VisitingCard visitingCard) async {
    final box = await visitingCardBox();
    await box.putAt(index, visitingCard);
  }
}
