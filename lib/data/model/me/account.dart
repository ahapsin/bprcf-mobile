import 'package:json_annotation/json_annotation.dart';
part 'account.g.dart';

@JsonSerializable()
class AccountModel {
  final String account_number;
  final String balance;
  final String type;

  AccountModel({
    required this.account_number,
    required this.balance,
    required this.type,
  });

  factory AccountModel.fromJson(Map<String, dynamic> data) =>
      _$AccountModelFromJson(data);
  Map<String, dynamic> toJson() => _$AccountModelToJson(this);
}
