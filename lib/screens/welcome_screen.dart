import 'package:flutter/material.dart';
import 'package:visiting_card/screens/user_card_page.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) {
            return UserCardPage();
          }));
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'VizCards',
                style: TextStyle(color: Colors.blueGrey, fontSize: 50),
              ),
              Text('tap anywhere to continue!', style: TextStyle(fontWeight: FontWeight.w300, letterSpacing: 1.2),)
            ],
          ),
        ),
      ),
    );
  }
}
