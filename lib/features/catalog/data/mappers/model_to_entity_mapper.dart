import 'package:movie_app/features/catalog/data/models/movie_model.dart';
import 'package:movie_app/features/catalog/domain/entities/movie.dart';

extension MovieX on MovieModel {
  Movie toEntity() {
    return Movie(
        id: id ?? 0,
        title: title ?? name ?? '',
        posterPath: posterPath ?? '',
        overview: overview ?? '');
  }
}
