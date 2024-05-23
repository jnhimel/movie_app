import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/features/catalog/data/models/movie_model.dart';

part 'catalog_response_model.g.dart';

@JsonSerializable()
class CatalogResponseModel {
  final int page;
  final List<MovieModel> results;
  @JsonKey(name: 'total_pages')
  final int totalPages;
  @JsonKey(name: 'total_results')
  final int totalResults;

  CatalogResponseModel(
      {required this.page,
      required this.results,
      required this.totalPages,
      required this.totalResults});

  factory CatalogResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CatalogResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$CatalogResponseModelToJson(this);
}
