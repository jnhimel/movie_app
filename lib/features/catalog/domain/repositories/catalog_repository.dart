import 'package:fpdart/fpdart.dart';
import 'package:movie_app/features/catalog/domain/entities/movie.dart';

import '../../../../core/error/failures.dart';

abstract interface class CatalogRepository {
  Future<Either<Failure, List<Movie>>> getMovies();
  Future<Either<Failure, List<Movie>>> getTVSeries();
}
