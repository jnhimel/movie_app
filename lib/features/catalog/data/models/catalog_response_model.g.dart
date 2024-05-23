// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatalogResponseModel _$CatalogResponseModelFromJson(
        Map<String, dynamic> json) =>
    CatalogResponseModel(
      page: (json['page'] as num).toInt(),
      results: (json['results'] as List<dynamic>)
          .map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: (json['total_pages'] as num).toInt(),
      totalResults: (json['total_results'] as num).toInt(),
    );

Map<String, dynamic> _$CatalogResponseModelToJson(
        CatalogResponseModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
