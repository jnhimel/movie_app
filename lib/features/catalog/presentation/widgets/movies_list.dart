import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/common/values/routes.dart';

import '../../../../core/common/values/strings.dart';
import '../../../../core/common/widgets/loader.dart';
import '../bloc/catalog_state.dart';
import '../bloc/movies_catalog_bloc.dart';

class MoviesList extends StatelessWidget {
  const MoviesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCatalogBloc, CatalogState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Loader(),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (movies) => GridView.custom(
            gridDelegate: SliverWovenGridDelegate.count(
              crossAxisCount: 2,
              pattern: [
                const WovenGridTile(
                  0.55,
                  crossAxisRatio: 0.9,
                  alignment: AlignmentDirectional.centerStart,
                ),
                const WovenGridTile(
                  0.6,
                  crossAxisRatio: 0.85,
                  alignment: AlignmentDirectional.centerEnd,
                ),
              ],
            ),
            childrenDelegate: SliverChildBuilderDelegate((context, index) {
              final movie = movies[index];
              return GestureDetector(
                onTap: () {
                  context.go(AppRoutes.movieDetailsPage, extra: movie);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: CachedNetworkImage(
                          imageUrl: AppStrings.imageBaseUrl + movie.posterPath,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => const Loader(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        movie.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              );
            }, childCount: movies.length),
          ),
          error: (message) => Center(
            child: Text('Error: $message'),
          ),
        );
      },
    );
  }
}
