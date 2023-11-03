// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountModel _$AccountModelFromJson(Map<String, dynamic> json) => AccountModel(
      account_number: json['account_number'] as String,
      balance: json['balance'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$AccountModelToJson(AccountModel instance) =>
    <String, dynamic>{
      'account_number': instance.account_number,
      'balance': instance.balance,
      'type': instance.type,
    };
