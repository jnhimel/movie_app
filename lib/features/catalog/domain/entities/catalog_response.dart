import 'package:movie_app/features/catalog/domain/entities/movie.dart';

class CatalogResponse {
  final int page;
  final List<Movie> results;
  final int totalPages;
  final int totalResults;

  CatalogResponse(
      {required this.page,
      required this.results,
      required this.totalPages,
      required this.totalResults});
}
