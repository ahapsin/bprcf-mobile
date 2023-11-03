import 'package:bprcf/data/model/me/account.dart';
import 'package:bprcf/data/model/me/customer.dart';
import 'package:json_annotation/json_annotation.dart';
part 'me.g.dart';

@JsonSerializable(explicitToJson: true)
class MeModel {
  final String? username;
  final String? password;
  final String? status;
  final String? group;
  // ignore: non_constant_identifier_names
  final String? profile_photo;
  final CustomerModel customer;
  final AccountModel account;

  MeModel({
    required this.username,
    required this.password,
    required this.status,
    required this.group,
    // ignore: non_constant_identifier_names
    required this.profile_photo,
    required this.customer,
    required this.account,
  });

  factory MeModel.fromJson(Map<String, dynamic> data) =>
      _$MeModelFromJson(data);

  Map<String, dynamic> toJson() => _$MeModelToJson(this);
}
