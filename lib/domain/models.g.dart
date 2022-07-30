// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GroupAdapter extends TypeAdapter<Group> {
  @override
  final int typeId = 1;

  @override
  Group read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Group(
      fields[0] as String?,
      fields[1] as int?,
      fields[2] as int?,
      fields[3] as int?,
      fields[4] as bool?,
      fields[5] as String?,
      fields[6] as DateTime,
      fields[7] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Group obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.numberOfMember)
      ..writeByte(2)
      ..write(obj.durationInMinute)
      ..writeByte(3)
      ..write(obj.paid)
      ..writeByte(4)
      ..write(obj.depositExist)
      ..writeByte(5)
      ..write(obj.deposit)
      ..writeByte(6)
      ..write(obj.registerTime)
      ..writeByte(7)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GroupAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
