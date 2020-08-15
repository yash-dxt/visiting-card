import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final Color visitingCardBlack = Colors.black54;
final Color majorColor = Colors.blue;

class NeuContainerWithoutPadding extends StatelessWidget {
  const NeuContainerWithoutPadding({
    @required this.width,
    @required this.height,
    this.child,
  });

  final double width;
  final double height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: Color(0xFFF0F2F5),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.white,
                blurRadius: 20,
                spreadRadius: 10,
                offset: Offset(10.0, 10.0)),
            BoxShadow(
                color: Color.fromRGBO(206, 213, 222, 0.8),
                blurRadius: 20,
                spreadRadius: 10)
          ]),
    );
  }
}

class NeuContainer extends StatelessWidget {
  const NeuContainer({
    @required this.width,
    @required this.height,
    this.child,
  });

  final double width;
  final double height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(10),
      child: child,
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: Color(0xFFF0F2F5),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.white,
                blurRadius: 20,
                spreadRadius: 10,
                offset: Offset(10.0, 10.0)),
            BoxShadow(
                color: Color.fromRGBO(206, 213, 222, 0.8),
                blurRadius: 20,
                spreadRadius: 10)
          ]),
    );
  }
}

class VisitingCardTwo extends StatelessWidget {
  const VisitingCardTwo({
    Key key,
    @required this.majorColor,
    @required this.visitingCardBlack,
    @required this.fullName,
    @required this.workPosition,
    @required this.email,
    @required this.address1,
    @required this.address2,
    @required this.address3,
    @required this.phoneNumber, this.path,
  }) : super(key: key);

  final Color majorColor;
  final Color visitingCardBlack;
  final String fullName;
  final String workPosition;
  final String email;
  final String address1;
  final String address2;
  final String address3;
  final String phoneNumber;
  final String path;
  @override
  Widget build(BuildContext context) {
    return NeuContainer(
      width: MediaQuery.of(context).size.width / 1.1,
      height: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
              child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 100,
              height: 100,
              child: path == null ? Container() : Image.file(File(path))
            ),
          )),
          Align(
            child: Text(
              fullName,
              style: TextStyle(color: majorColor, fontSize: 20),
            ),
            alignment: Alignment.bottomRight,
          ),
          Align(
            child: Text(
              workPosition,
              style: TextStyle(color: visitingCardBlack, fontSize: 14),
            ),
            alignment: Alignment.bottomRight,
          ),
          Align(
            child: Text(
              email,
              style: TextStyle(color: visitingCardBlack, fontSize: 12),
            ),
            alignment: Alignment.bottomRight,
          ),
          SizedBox(height: 15),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: majorColor,
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$address1 \n $address1  \n $address3 ',
                style: TextStyle(color: visitingCardBlack, fontSize: 12),
              ),
              Text(
                phoneNumber,
                style: TextStyle(color: visitingCardBlack, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class VisitingCardOne extends StatelessWidget {
  const VisitingCardOne({
    Key key,
    @required this.majorColor,
    @required this.visitingCardBlack,
  }) : super(key: key);

  final Color majorColor;
  final Color visitingCardBlack;

  @override
  Widget build(BuildContext context) {
    return NeuContainer(
      width: MediaQuery.of(context).size.width / 1.1,
      height: 250,
      child: Row(
        children: [
          Align(
            child: Container(
              width: 100,
              height: 100,
              child: Image.network('https://i.imgur.com/1Ei0r5n.jpg'),
            ),
          ),
          SizedBox(width: 10),
          Container(
            width: 1,
            height: MediaQuery.of(context).size.height,
            color: majorColor,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Align(
                  child: Text(
                    'Yash Dixit',
                    style: TextStyle(color: majorColor, fontSize: 20),
                  ),
                ),
                Align(
                  child: Text(
                    'CEO - Google',
                    style: TextStyle(color: visitingCardBlack, fontSize: 14),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  child: Text(
                    'yashdixitsq@gmail.com',
                    style: TextStyle(color: visitingCardBlack, fontSize: 12),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    '+91 9560704941',
                    style: TextStyle(color: visitingCardBlack, fontSize: 12),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    'B/2-629, Ekta Gardens,\nPatparganj, IP Extension\n New Delhi',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: visitingCardBlack,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
