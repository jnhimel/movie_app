import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/movie.dart';
import '../repositories/catalog_repository.dart';

class GetTvSeriesUsecase implements UseCase<List<Movie>, NoParams> {
  final CatalogRepository catalogRepository;
  GetTvSeriesUsecase(this.catalogRepository);
  @override
  Future<Either<Failure, List<Movie>>> call(NoParams params) async {
    return await catalogRepository.getTVSeries();
  }
}
