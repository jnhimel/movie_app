import 'package:dio/dio.dart';
import 'package:movie_app/core/common/values/strings.dart';
import 'package:movie_app/features/catalog/data/models/catalog_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'catalog_api_service.g.dart';

@RestApi(baseUrl: AppStrings.baseUrl)
abstract class CatalogApiService {
  factory CatalogApiService(Dio dio, {String baseUrl}) = _CatalogApiService;

  @GET('/movie/popular')
  Future<CatalogResponseModel> fetchMovies(@Query('api_key') String apiKey);

  @GET('/tv/popular')
  Future<CatalogResponseModel> fetchTVSeries(@Query('api_key') String apiKey);
}
