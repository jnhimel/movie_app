import 'package:json_annotation/json_annotation.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel {
  final int? id;
  final String? title;
  final String? name;
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  final String? overview;

  MovieModel(
      {required this.id,
      required this.title,
      required this.name,
      required this.posterPath,
      required this.overview});

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);
  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}
