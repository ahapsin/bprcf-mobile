// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerModel _$CustomerModelFromJson(Map<String, dynamic> json) =>
    CustomerModel(
      name: json['name'] as String,
      short_name: json['short_name'] as String,
      address: json['address'] as String,
      phone_number: json['phone_number'] as String,
      brith_date: json['brith_date'] as String,
    );

Map<String, dynamic> _$CustomerModelToJson(CustomerModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'short_name': instance.short_name,
      'address': instance.address,
      'phone_number': instance.phone_number,
      'brith_date': instance.brith_date,
    };
