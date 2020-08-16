// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VisitingCardAdapter extends TypeAdapter<VisitingCard> {
  @override
  final int typeId = 0;

  @override
  VisitingCard read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VisitingCard(
      fullName: fields[0] as String,
      workPosition: fields[1] as String,
      email: fields[2] as String,
      address1: fields[3] as String,
      address2: fields[4] as String,
      address3: fields[5] as String,
      phoneNumber: fields[6] as String,
      path: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, VisitingCard obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.fullName)
      ..writeByte(1)
      ..write(obj.workPosition)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.address1)
      ..writeByte(4)
      ..write(obj.address2)
      ..writeByte(5)
      ..write(obj.address3)
      ..writeByte(6)
      ..write(obj.phoneNumber)
      ..writeByte(7)
      ..write(obj.path);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VisitingCardAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
