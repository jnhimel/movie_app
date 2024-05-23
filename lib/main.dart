import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/common/values/routes.dart';
import 'package:movie_app/features/catalog/presentation/bloc/movies_catalog_bloc.dart';
import 'package:movie_app/features/catalog/presentation/bloc/tv_series_catalog_bloc.dart';

import 'core/theme/theme.dart';
import 'features/catalog/domain/entities/movie.dart';
import 'features/catalog/presentation/bloc/catalog_event.dart';
import 'features/catalog/presentation/pages/movie_list_screen.dart';
import 'features/details/presentation/pages/movie_details_screen.dart';
import 'service_locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter(
      routes: [
        GoRoute(
            path: AppRoutes.catalogPage,
            builder: (context, state) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => getIt<MoviesCatalogBloc>()
                        ..add(const CatalogEvent.fetchMovies()),
                    ),
                    BlocProvider(
                      create: (context) => getIt<TvSeriesCatalogBloc>()
                        ..add(const CatalogEvent.fetchMovies()),
                    )
                  ],
                  child: const MovieListScreen(),
                ),
            routes: [
              GoRoute(
                path: 'movieDetails',
                builder: (context, state) {
                  final movie = state.extra as Movie;
                  return MovieDetailsScreen(movie: movie);
                },
              ),
            ]),
      ],
    );

    return MaterialApp.router(
      routerConfig: router,
      title: 'Movie Catalog',
      theme: AppTheme.darkThemeMode,
    );
  }
}
