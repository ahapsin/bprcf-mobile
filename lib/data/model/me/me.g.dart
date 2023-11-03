// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'me.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeModel _$MeModelFromJson(Map<String, dynamic> json) => MeModel(
      username: json['username'] as String?,
      password: json['password'] as String?,
      status: json['status'] as String?,
      group: json['group'] as String?,
      profile_photo: json['profile_photo'] as String?,
      customer:
          CustomerModel.fromJson(json['customer'] as Map<String, dynamic>),
      account: AccountModel.fromJson(json['account'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MeModelToJson(MeModel instance) => <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'status': instance.status,
      'group': instance.group,
      'profile_photo': instance.profile_photo,
      'customer': instance.customer.toJson(),
      'account': instance.account.toJson(),
    };
