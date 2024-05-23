import 'package:bloc/bloc.dart';
import 'package:movie_app/features/catalog/domain/usecases/get_movies_usecase.dart';

import '../../../../core/usecases/usecase.dart';
import 'catalog_event.dart';
import 'catalog_state.dart';

class MoviesCatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  final GetMoviesUseCase getMoviesUseCase;

  MoviesCatalogBloc({
    required this.getMoviesUseCase,
  }) : super(const CatalogState.initial()) {
    on<CatalogEvent>((event, emit) async {
      await event.when(
        fetchMovies: () async {
          emit(const CatalogState.loading());
          try {
            final response = await getMoviesUseCase.call(NoParams());
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
