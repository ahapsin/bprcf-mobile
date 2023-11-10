import 'package:bprcf/data/model/me/account.dart';
import 'package:json_annotation/json_annotation.dart';
part 'data.g.dart';

@JsonSerializable(explicitToJson: true)
class Data {
  final String username;
  final String password;
  final String status;
  final String group;
  final String profile_photo;
  final AccountModel account;

  Data({
    required this.username,
    required this.password,
    required this.status,
    required this.group,
    // ignore: non_constant_identifier_names
    required this.profile_photo,
    required this.account,
  });

  factory Data.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
