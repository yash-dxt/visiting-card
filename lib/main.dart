import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:visiting_card/screens/user_card_page.dart';
import 'package:visiting_card/screens/welcome_screen.dart';
import 'package:visiting_card/services/card_data.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/card_model.dart';

void main() async{
  var initialized = false;
  print(initialized);
  if (!initialized) {
    initialized = true;
    await Hive.initFlutter();

    Hive.registerAdapter<VisitingCard>(VisitingCardAdapter());
  }
  print(initialized);
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
        cardData.getVisitingCards();
        return cardData;
      },
      child: MaterialApp(
        home: WelcomeScreen(),
      ),
    );
  }
}
