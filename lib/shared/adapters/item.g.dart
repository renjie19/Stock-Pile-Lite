// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemAdapter extends TypeAdapter<Item> {
  @override
  final int typeId = 4;

  @override
  Item read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Item(
      fields[0] as String,
      fields[1] as int,
      fields[2] as int,
      fields[3] as String,
      fields[4] as String,
      fields[5] as bool,
      fields[6] as String,
      fields[7] as String,
      fields[8] as String,
      fields[9] as double,
      fields[10] as double,
      fields[11] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Item obj) {
    writer
      ..writeByte(12)
      ..writeByte(6)
      ..write(obj.itemCode)
      ..writeByte(7)
      ..write(obj.name)
      ..writeByte(8)
      ..write(obj.brand)
      ..writeByte(9)
      ..write(obj.capital)
      ..writeByte(10)
      ..write(obj.retail)
      ..writeByte(11)
      ..write(obj.wholeSale)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.dateCreated)
      ..writeByte(2)
      ..write(obj.dateModified)
      ..writeByte(3)
      ..write(obj.createdBy)
      ..writeByte(4)
      ..write(obj.modifiedBy)
      ..writeByte(5)
      ..write(obj.active);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
