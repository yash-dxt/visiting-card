import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:visiting_card/screens/form_page.dart';
import 'package:visiting_card/screens/user_card_page.dart';
import 'package:visiting_card/services/card_data.dart';
import 'package:visiting_card/widgets/widgets.dart';

import 'models/card_model.dart';

void main() async{
  runApp(MyApp());

  _requestPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();

    final info = statuses[Permission.storage].toString();
    print(info);
  }
  await _requestPermission();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        CardData cardData = CardData();

        cardData.addNewCard(
          VisitingCard(
              fullName: 'Yash Dixit',
              workPosition: 'CEO-Google',
              email: 'yashdixitsq@gmail.com',
              address1: 'B/2-629, Ekta Gardens',
              address2: 'Patparganj, IP Extension',
              address3: 'New Delhi',
              phoneNumber: '+91 9560704941'),
        );
        return cardData;
      },
      child: MaterialApp(
        home: UserCardPage(),
      ),
    );
  }
}
