// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_model_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TokenModelHiveAdapter extends TypeAdapter<TokenModelHive> {
  @override
  final int typeId = 0;

  @override
  TokenModelHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TokenModelHive(
      token: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TokenModelHive obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.token);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TokenModelHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenModelHive _$TokenModelHiveFromJson(Map<String, dynamic> json) =>
    TokenModelHive(
      token: json['token'] as String,
    );

Map<String, dynamic> _$TokenModelHiveToJson(TokenModelHive instance) =>
    <String, dynamic>{
      'token': instance.token,
    };
