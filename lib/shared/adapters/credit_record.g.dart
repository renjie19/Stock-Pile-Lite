// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/credit_record.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CreditRecordAdapter extends TypeAdapter<CreditRecord> {
  @override
  final int typeId = 8;

  @override
  CreditRecord read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CreditRecord(
      fields[0] as String,
      fields[1] as int,
      fields[2] as int,
      fields[3] as String,
      fields[4] as String,
      fields[5] as bool,
      fields[6] as Customer,
      fields[7] as double,
      fields[8] as double,
      fields[9] as String,
      fields[10] as double,
      (fields[11] as List)?.cast<CreditItem>(),
      (fields[12] as List)?.cast<Payment>(),
    );
  }

  @override
  void write(BinaryWriter writer, CreditRecord obj) {
    writer
      ..writeByte(13)
      ..writeByte(6)
      ..write(obj.customer)
      ..writeByte(7)
      ..write(obj.totalAmount)
      ..writeByte(8)
      ..write(obj.amountPaid)
      ..writeByte(9)
      ..write(obj.paymentStatus)
      ..writeByte(10)
      ..write(obj.transferredAmount)
      ..writeByte(11)
      ..write(obj.items)
      ..writeByte(12)
      ..write(obj.payments)
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
      other is CreditRecordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
