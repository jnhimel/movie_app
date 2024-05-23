import 'package:freezed_annotation/freezed_annotation.dart';

part 'catalog_event.freezed.dart';

@freezed
class CatalogEvent with _$CatalogEvent {
  const factory CatalogEvent.fetchMovies() = _FetchMovies;
}
