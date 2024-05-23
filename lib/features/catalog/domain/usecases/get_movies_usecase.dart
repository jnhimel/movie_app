import 'package:fpdart/fpdart.dart';
import 'package:movie_app/features/catalog/domain/entities/movie.dart';
import 'package:movie_app/features/catalog/domain/repositories/catalog_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

class GetMoviesUseCase implements UseCase<List<Movie>, NoParams> {
  final CatalogRepository catalogRepository;
  GetMoviesUseCase(this.catalogRepository);
  @override
  Future<Either<Failure, List<Movie>>> call(NoParams params) async {
    return await catalogRepository.getMovies();
  }
}
