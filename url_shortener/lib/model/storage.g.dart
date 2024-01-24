// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LinkStorageAdapter extends TypeAdapter<LinkStorage> {
  @override
  final int typeId = 1;

  @override
  LinkStorage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LinkStorage(
      shortLink: fields[0] as String,
      description: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LinkStorage obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.shortLink)
      ..writeByte(1)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LinkStorageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
