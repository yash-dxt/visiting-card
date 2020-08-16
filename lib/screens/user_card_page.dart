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
          body: cardData.cards.length == 0
              ? Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Your visiting cards appear here!',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1.2),
                        ),
                        Column(
                          children: [
                            Text(
                              'Tap on them to Share',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1.2),
                            ),
                            Text(
                              'Long Press on them to Delete',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1.2),
                            ),
                          ],
                        ),
                        Text(
                          'Click on Add to get started',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              letterSpacing: 1.2),
                        ),
                      ],
                    ),
                  ),
                )
              : ListView.builder(
                  padding:
                      EdgeInsets.only(left: 15, right: 15, bottom: 20, top: 20),
                  itemCount: cardData.cards.length,
                  itemBuilder: (context, index) {
                    VisitingCard card = cardData.cards[index];
                    return InkWell(
                      onLongPress: () async {
                        await cardData.deleteCard(index);
                      },
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return SharingPage(
                            card: card,
                            cardData: cardData,
                            index: index,
                          );
                        }));
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
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
                      ),
                    );
                  }));
    });
  }
}
