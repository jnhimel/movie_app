import 'package:flutter/material.dart';
import 'package:movie_app/core/common/values/strings.dart';

import '../widgets/movies_list.dart';
import '../widgets/tv_series_list.dart';

class MovieListScreen extends StatelessWidget {
  const MovieListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                const Text(
                  AppStrings.homePageMessage,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                Container(
                  height: 60,
                  margin: const EdgeInsets.only(top: 16),
                  child: const TextField(),
                ),
                DefaultTabController(
                    length: 2,
                    child: Column(
                      children: [
                        const TabBar(tabs: [
                          Tab(
                            text: AppStrings.movies,
                          ),
                          Tab(
                            text: AppStrings.tvSeries,
                          ),
                        ]),
                        SizedBox(
                          height: MediaQuery.of(context).size.height - 240,
                          child: const TabBarView(children: [
                            MoviesList(),
                            TVSeriesList(),
                          ]),
                        ),
                      ],
                    )),
              ],
            ),
          ),
          // child: CustomScrollView(
          //   slivers: [
          //     SliverAppBar(
          //       expandedHeight: 160,
          //       flexibleSpace: Column(
          //         children: [
          //           const Text(
          //             AppStrings.homePageMessage,
          //             style: TextStyle(
          //               fontWeight: FontWeight.bold,
          //               fontSize: 24,
          //               color: Colors.white,
          //             ),
          //           ),
          //           Container(
          //             height: 60,
          //             width: double.maxFinite,
          //             margin: const EdgeInsets.only(top: 16),
          //             child: const TextField(),
          //           ),
          //         ],
          //       ),
          //     ),
          //     SliverToBoxAdapter(
          //       child: BlocBuilder<CatalogBloc, CatalogState>(
          //         builder: (context, state) {
          //           return state.when(
          //             initial: () => const Loader(),
          //             loading: () =>
          //                 const Center(child: CircularProgressIndicator()),
          //             loaded: (movies) => GridView.custom(
          //               shrinkWrap: true,
          //               physics: const NeverScrollableScrollPhysics(),
          //               gridDelegate: SliverWovenGridDelegate.count(
          //                 crossAxisCount: 2,
          //                 pattern: [
          //                   const WovenGridTile(
          //                     0.55,
          //                     crossAxisRatio: 0.9,
          //                     alignment: AlignmentDirectional.centerStart,
          //                   ),
          //                   const WovenGridTile(
          //                     0.6,
          //                     crossAxisRatio: 0.85,
          //                     alignment: AlignmentDirectional.centerEnd,
          //                   ),
          //                 ],
          //               ),
          //               childrenDelegate:
          //                   SliverChildBuilderDelegate((context, index) {
          //                 final movie = movies[index];
          //                 return GestureDetector(
          //                   onTap: () {
          //                     context.go(AppRoutes.movieDetailsPage,
          //                         extra: movie);
          //                   },
          //                   child: Column(
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       Expanded(
          //                         child: ClipRRect(
          //                           borderRadius: BorderRadius.circular(15),
          //                           child: CachedNetworkImage(
          //                             imageUrl: AppStrings.imageBaseUrl +
          //                                 movie.posterPath,
          //                             fit: BoxFit.cover,
          //                             placeholder: (context, url) =>
          //                                 const Loader(),
          //                             errorWidget: (context, url, error) =>
          //                                 const Icon(Icons.error),
          //                           ),
          //                         ),
          //                       ),
          //                       Padding(
          //                         padding: const EdgeInsets.all(8.0),
          //                         child: Text(
          //                           movie.title,
          //                           style: const TextStyle(
          //                             fontWeight: FontWeight.bold,
          //                             fontSize: 16,
          //                             color: Colors.white,
          //                           ),
          //                           overflow: TextOverflow.ellipsis,
          //                           maxLines: 2,
          //                         ),
          //                       ),
          //                     ],
          //                   ),
          //                 );
          //               }, childCount: movies.length),
          //             ),
          //             error: (message) => Center(
          //               child: Text('Error: $message'),
          //             ),
          //           );
          //         },
          //       ),
          //     ),
          //
          //   ],
          // ),
        ),
      ),
    );
  }
}
