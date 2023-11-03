// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mutation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MutationModel _$MutationModelFromJson(Map<String, dynamic> json) =>
    MutationModel(
      id: json['id'] as String,
      entry_time: json['entry_time'] as String,
      posting_date: json['posting_date'] as String,
      amount: (json['amount'] as num).toDouble(),
      trans_code: json['trans_code'] as String,
      trans_type: json['trans_type'] as String,
      desc: json['desc'] as String,
    );

Map<String, dynamic> _$MutationModelToJson(MutationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'entry_time': instance.entry_time,
      'posting_date': instance.posting_date,
      'amount': instance.amount,
      'trans_code': instance.trans_code,
      'trans_type': instance.trans_type,
      'desc': instance.desc,
    };
