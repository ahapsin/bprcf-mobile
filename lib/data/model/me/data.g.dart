// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      username: json['username'] as String,
      password: json['password'] as String,
      status: json['status'] as String,
      group: json['group'] as String,
      profile_photo: json['profile_photo'] as String,
      account: AccountModel.fromJson(json['account'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'status': instance.status,
      'group': instance.group,
      'profile_photo': instance.profile_photo,
      'account': instance.account.toJson(),
    };
