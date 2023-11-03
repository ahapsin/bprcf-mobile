import 'package:json_annotation/json_annotation.dart';
part 'customer.g.dart';

@JsonSerializable()
class CustomerModel {
  final String name;
  final String short_name;
  final String address;
  final String phone_number;
  final String brith_date;

  CustomerModel({
    required this.name,
    required this.short_name,
    required this.address,
    required this.phone_number,
    required this.brith_date,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> data) =>
      _$CustomerModelFromJson(data);
  Map<String, dynamic> toJson() => _$CustomerModelToJson(this);
}
