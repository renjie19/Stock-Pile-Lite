// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/customer.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CustomerAdapter extends TypeAdapter<Customer> {
  @override
  final int typeId = 7;

  @override
  Customer read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Customer(
      fields[0] as String,
      fields[1] as int,
      fields[2] as int,
      fields[3] as String,
      fields[4] as String,
      fields[5] as bool,
      fields[6] as String,
      fields[7] as String,
      fields[8] as String,
      fields[9] as int,
      fields[10] as int,
      fields[11] as String,
      fields[12] as String,
      fields[13] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Customer obj) {
    writer
      ..writeByte(14)
      ..writeByte(6)
      ..write(obj.firstName)
      ..writeByte(7)
      ..write(obj.lastName)
      ..writeByte(8)
      ..write(obj.address)
      ..writeByte(9)
      ..write(obj.birthDate)
      ..writeByte(10)
      ..write(obj.age)
      ..writeByte(11)
      ..write(obj.contactNumber)
      ..writeByte(12)
      ..write(obj.coMaker)
      ..writeByte(13)
      ..write(obj.coMakerContactNumber)
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
      other is CustomerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
