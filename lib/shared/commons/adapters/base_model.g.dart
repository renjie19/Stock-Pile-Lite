// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/base_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BaseModelAdapter extends TypeAdapter<BaseModel> {
  @override
  final int typeId = 1;

  @override
  BaseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BaseModel(
      id: fields[0] as String,
      dateCreated: fields[1] as int,
      dateModified: fields[2] as int,
      createdBy: fields[3] as String,
      modifiedBy: fields[4] as String,
      active: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, BaseModel obj) {
    writer
      ..writeByte(6)
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
      other is BaseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
