import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

part 'card_model.g.dart';

@HiveType(typeId: 0)
class VisitingCard {
  @HiveField(0)
  final String fullName;
  @HiveField(1)
  final String workPosition;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String address1;
  @HiveField(4)
  final String address2;
  @HiveField(5)
  final String address3;
  @HiveField(6)
  final String phoneNumber;

  @HiveField(7)
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
