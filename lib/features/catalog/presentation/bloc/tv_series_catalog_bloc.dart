import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/catalog/domain/usecases/get_tv_series_usecase.dart';

import '../../../../core/usecases/usecase.dart';
import 'catalog_event.dart';
import 'catalog_state.dart';

class TvSeriesCatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  final GetTvSeriesUsecase getTvSeriesUsecase;

  TvSeriesCatalogBloc({
    required this.getTvSeriesUsecase,
  }) : super(const CatalogState.initial()) {
    on<CatalogEvent>((event, emit) async {
      await event.when(
        fetchMovies: () async {
          emit(const CatalogState.loading());
          try {
            final response = await getTvSeriesUsecase.call(NoParams());
            response.fold(
              (l) => emit(CatalogState.error(l.message)),
              (r) => emit(CatalogState.loaded(r)),
            );
          } catch (error) {
            emit(CatalogState.error(error.toString()));
          }
        },
      );
    });
  }
}
