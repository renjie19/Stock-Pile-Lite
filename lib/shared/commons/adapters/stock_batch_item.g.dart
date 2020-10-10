// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/stock_batch_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StockBatchItemAdapter extends TypeAdapter<StockBatchItem> {
  @override
  final int typeId = 6;

  @override
  StockBatchItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StockBatchItem()
      ..name = fields[6] as String
      ..brand = fields[7] as String
      ..capital = fields[8] as double
      ..itemCode = fields[9] as String
      ..quantity = fields[10] as double;
  }

  @override
  void write(BinaryWriter writer, StockBatchItem obj) {
    writer
      ..writeByte(5)
      ..writeByte(6)
      ..write(obj.name)
      ..writeByte(7)
      ..write(obj.brand)
      ..writeByte(8)
      ..write(obj.capital)
      ..writeByte(9)
      ..write(obj.itemCode)
      ..writeByte(10)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StockBatchItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
