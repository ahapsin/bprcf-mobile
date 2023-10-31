import 'package:json_annotation/json_annotation.dart';
part 'mutation.g.dart';

@JsonSerializable()
class MutationModel {
  final String id;
  final String entry_time;
  final String posting_date;
  final int amount;
  final String trans_code;
  final String trans_type;
  final String desc;

  MutationModel({
    required this.id,
    required this.entry_time,
    required this.posting_date,
    required this.amount,
    required this.trans_code,
    required this.trans_type,
    required this.desc,
  });
  factory MutationModel.fromJson(Map<String, dynamic> data) =>
      _$MutationModelFromJson(data);

  Map<String, dynamic> toJson() => _$MutationModelToJson(this);
}
