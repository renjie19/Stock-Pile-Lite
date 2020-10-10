// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/stock_batch.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StockBatchAdapter extends TypeAdapter<StockBatch> {
  @override
  final int typeId = 5;

  @override
  StockBatch read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StockBatch(
      fields[0] as String,
      fields[1] as int,
      fields[2] as int,
      fields[3] as String,
      fields[4] as String,
      fields[5] as bool,
      fields[6] as String,
      (fields[7] as HiveList)?.castHiveList(),
    );
  }

  @override
  void write(BinaryWriter writer, StockBatch obj) {
    writer
      ..writeByte(8)
      ..writeByte(6)
      ..write(obj.batchNumber)
      ..writeByte(7)
      ..write(obj.stockItems)
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
      other is StockBatchAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
