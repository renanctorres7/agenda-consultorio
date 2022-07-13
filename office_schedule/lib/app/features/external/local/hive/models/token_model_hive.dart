import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'token_model_hive.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class TokenModelHive extends HiveObject {
  @HiveField(0)
  final String token;

  TokenModelHive({required this.token});

  factory TokenModelHive.fromJson(Map<String, dynamic> json) =>
      _$TokenModelHiveFromJson(json);
  Map<String, dynamic> toJson() => _$TokenModelHiveToJson(this);
}
