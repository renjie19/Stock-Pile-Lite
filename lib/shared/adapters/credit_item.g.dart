// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/credit_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CreditItemAdapter extends TypeAdapter<CreditItem> {
  @override
  final int typeId = 9;

  @override
  CreditItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CreditItem()
      ..name = fields[0] as String
      ..brand = fields[1] as String
      ..price = fields[2] as double
      ..quantity = fields[3] as double
      ..total = fields[4] as double;
  }

  @override
  void write(BinaryWriter writer, CreditItem obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.brand)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.quantity)
      ..writeByte(4)
      ..write(obj.total);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreditItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
