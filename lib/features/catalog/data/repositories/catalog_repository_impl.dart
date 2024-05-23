import 'package:fpdart/src/either.dart';
import 'package:movie_app/core/error/exceptions.dart';
import 'package:movie_app/core/error/failures.dart';
import 'package:movie_app/core/secrets/app_secrets.dart';
import 'package:movie_app/features/catalog/data/mappers/model_to_entity_mapper.dart';
import 'package:movie_app/features/catalog/domain/entities/movie.dart';
import 'package:movie_app/features/catalog/domain/repositories/catalog_repository.dart';

import '../datasources/catalog_api_service.dart';

class CatalogRepositoryImpl implements CatalogRepository {
  final CatalogApiService catalogApiService;

  CatalogRepositoryImpl(this.catalogApiService);
  @override
  Future<Either<Failure, List<Movie>>> getMovies() async {
    try {
      final res = await catalogApiService.fetchMovies(AppSecrets.tmdbApiKey);
      List<Movie> movies = res.results.map((e) => e.toEntity()).toList();
      return right(movies);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTVSeries() async {
    try {
      final res = await catalogApiService.fetchTVSeries(AppSecrets.tmdbApiKey);
      List<Movie> movies = res.results.map((e) => e.toEntity()).toList();
      return right(movies);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
