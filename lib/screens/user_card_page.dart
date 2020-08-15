import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visiting_card/models/card_model.dart';
import 'package:visiting_card/screens/form_page.dart';
import 'package:visiting_card/screens/sharing_page.dart';
import 'package:visiting_card/services/card_data.dart';
import 'package:visiting_card/widgets/widgets.dart';

class UserCardPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Consumer<CardData>(
        builder: (BuildContext context, cardData, Widget child) {
      return Scaffold(
          floatingActionButton: FloatingActionButton.extended(
            heroTag: 'a',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FormPage(
                  cardData: cardData,
                );
              }));
            },
            label: Text('ADD'),
            icon: Icon(
              Icons.add,
            ),
          ),
          body: ListView.builder(
              padding:
                  EdgeInsets.only(left: 15, right: 15, bottom: 20, top: 20),
              itemCount: cardData.cards.length,
              itemBuilder: (context, index) {
                VisitingCard card = cardData.cards[index];
                return InkWell(
                  onLongPress: () {
                    cardData.deleteCard(card);
                  },
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return SharingPage(
                        card: card,
                      );
                    }));
                  },
                  child: VisitingCardTwo(
                    majorColor: majorColor,
                    visitingCardBlack: visitingCardBlack,
                    workPosition: card.workPosition,
                    address1: card.address1,
                    address2: card.address2,
                    address3: card.address3,
                    phoneNumber: card.phoneNumber,
                    email: card.email,
                    fullName: card.fullName,
                    path: card.path,
                  ),
                );
              }));
    });
  }
}
