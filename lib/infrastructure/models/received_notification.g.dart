// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'received_notification.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReceivedNotificationAdapter extends TypeAdapter<ReceivedNotification> {
  @override
  final int typeId = 1;

  @override
  ReceivedNotification read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReceivedNotification(
      id: fields[0] as int,
      title: fields[1] as String,
      body: fields[2] as String,
      receivedAt: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, ReceivedNotification obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.body)
      ..writeByte(3)
      ..write(obj.receivedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReceivedNotificationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
