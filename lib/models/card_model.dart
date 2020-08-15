import 'package:flutter/cupertino.dart';

class VisitingCard {
  final String fullName;
  final String workPosition;
  final String email;
  final String address1;
  final String address2;
  final String address3;
  final String phoneNumber;
  final String path;

  const VisitingCard(
      {@required this.fullName,
      @required this.workPosition,
      @required this.email,
      @required this.address1,
      @required this.address2,
      @required this.address3,
      @required this.phoneNumber,
      this.path});
}
