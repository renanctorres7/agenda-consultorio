// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserProfileHiveAdapter extends TypeAdapter<UserProfileHive> {
  @override
  final int typeId = 0;

  @override
  UserProfileHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserProfileHive(
      fullName: fields[1] as String,
      phone: fields[2] as String,
      company: fields[3] as String,
      specialty: fields[4] as String,
      objectId: fields[5] as String,
      email: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserProfileHive obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.email)
      ..writeByte(1)
      ..write(obj.fullName)
      ..writeByte(2)
      ..write(obj.phone)
      ..writeByte(3)
      ..write(obj.company)
      ..writeByte(4)
      ..write(obj.specialty)
      ..writeByte(5)
      ..write(obj.objectId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserProfileHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileHive _$UserProfileHiveFromJson(Map<String, dynamic> json) =>
    UserProfileHive(
      fullName: json['fullName'] as String,
      phone: json['phone'] as String,
      company: json['company'] as String,
      specialty: json['specialty'] as String,
      objectId: json['objectId'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$UserProfileHiveToJson(UserProfileHive instance) =>
    <String, dynamic>{
      'email': instance.email,
      'fullName': instance.fullName,
      'phone': instance.phone,
      'company': instance.company,
      'specialty': instance.specialty,
      'objectId': instance.objectId,
    };
