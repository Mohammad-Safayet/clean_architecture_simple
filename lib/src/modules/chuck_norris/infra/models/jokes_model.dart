import 'package:json_annotation/json_annotation.dart';

part 'random_model.g.dart';

@JsonSerializable()
class JokeModel {
  final List<String> categories;
  @JsonKey(name: "created_at")
  final String createdAt;
  @JsonKey(name: "updated_at")
  final String updatedAt;
  @JsonKey(name: "icon_url")
  final String iconUrl;
  final String id;
  final String url;
  final String value;

  JokeModel({
    required this.categories,
    required this.createdAt,
    required this.updatedAt,
    required this.iconUrl,
    required this.id,
    required this.url,
    required this.value,
  });

  factory JokeModel.fromJson(Map<String, dynamic> json) =>
      _$RandomModelFromJson(json);

  Map<String, dynamic> toJson() => _$RandomModelToJson(this);
}
