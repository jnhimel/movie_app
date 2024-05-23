import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/features/catalog/data/repositories/catalog_repository_impl.dart';
import 'package:movie_app/features/catalog/domain/repositories/catalog_repository.dart';
import 'package:movie_app/features/catalog/domain/usecases/get_movies_usecase.dart';
import 'package:movie_app/features/catalog/domain/usecases/get_tv_series_usecase.dart';
import 'package:movie_app/features/catalog/presentation/bloc/movies_catalog_bloc.dart';
import 'package:movie_app/features/catalog/presentation/bloc/tv_series_catalog_bloc.dart';

import 'features/catalog/data/datasources/catalog_api_service.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<CatalogApiService>(CatalogApiService(getIt<Dio>()));
  getIt.registerFactory<CatalogRepository>(
      () => CatalogRepositoryImpl(getIt<CatalogApiService>()));
  getIt.registerFactory(() => GetMoviesUseCase(getIt<CatalogRepository>()));
  getIt.registerFactory(() => GetTvSeriesUsecase(getIt<CatalogRepository>()));
  getIt.registerFactory(
      () => MoviesCatalogBloc(getMoviesUseCase: getIt<GetMoviesUseCase>()));
  getIt.registerFactory(() =>
      TvSeriesCatalogBloc(getTvSeriesUsecase: getIt<GetTvSeriesUsecase>()));
}
