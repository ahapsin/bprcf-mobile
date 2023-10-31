import 'package:json_annotation/json_annotation.dart';
part 'me.g.dart';

@JsonSerializable()
class MeModel {
  final String username;
  final String group;
  MeModel({
    required this.username,
    required this.group,
  });

  factory MeModel.fromJson(Map<String, dynamic> data) =>
      _$MeModelFromJson(data);
}
