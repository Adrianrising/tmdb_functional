import 'package:flutter/material.dart';
import 'package:moviedb_functional/constant/dimens.dart';
import 'package:moviedb_functional/data/apply/tmdb_apply.dart';
import 'package:moviedb_functional/data/apply/tmdb_apply_impl.dart';

import '../../../data/vos/get_genres_vo/get_genres_vo.dart';
import '../../../data/vos/get_now_playing_vo/get_now_playing_vo.dart';
import '../../../easy_widget/easy_scrollable_widget.dart';

class MoviesByGenresView extends StatefulWidget {
  const MoviesByGenresView({Key? key}) : super(key: key);

  @override
  State<MoviesByGenresView> createState() => _MoviesByGenresViewState();
}

class _MoviesByGenresViewState extends State<MoviesByGenresView> {
  final TmdbApply tmDbApply = TmdbApplyImpl();
  final ScrollController scrollController = ScrollController();
  List<GetGenresVO> genre = [];
  List<GetNowPlayingVO> moviesByGenre = [];
  int movieId = 0;
  int page = 1;

  @override
  void initState() {
    tmDbApply.getGenres().then((value) {
      if(mounted){
        setState(() {
          genre = value ?? [];
          movieId = genre[0].id ?? 0;
          tmDbApply.getMoviesByGenre(movieId, page).then((value) {
            setState(() {
              moviesByGenre = value ?? [];
            });
          });
          // tmDbApply.getMoviesByGenreFromBoxAsStream(movieId, page).listen((event) {
          //   setState(() {
          //     moviesByGenre=event??[];
          //   });
          // });
        });
      }

    });

    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          page++;
          tmDbApply.getMoviesByGenre(movieId, page).then((value) {
            final temp = value ?? [];
            if (temp.isNotEmpty) {
              for (var element in temp) {
                moviesByGenre.add(element);
              }
              setState(() {});
            }
          });
        }
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: genre.length,
      child: SizedBox(
        height: moviesByGenreSectionHeight,
        width: double.infinity,
        child: Column(
          children: [

            //tab bar
            TabBar(
              indicatorColor: Colors.amber,
              isScrollable: true,
              tabs: genre.map((e) => Tab(text: e.name)).toList(),
              onTap: (index) => tmDbApply
                  .getMoviesByGenre(genre[index].id ?? 0, page)
                  .then((value) {
                setState(() {
                  moviesByGenre = value ?? [];
                });
              }),
            ),

            //tab bar view
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: sp15x),
                color: Colors.blueGrey.shade900,
                child: TabBarView(
                  children: [
                    for (var i = 0; i < genre.length; i++)
                      ListView.builder(
                        controller: scrollController,
                        scrollDirection: Axis.horizontal,
                        itemCount: moviesByGenre.length,
                        itemBuilder: (context, index) {
                          return EasyScrollableWidget(
                            index: index,
                            genreMovies: moviesByGenre,
                          );
                        },
                      ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


//Column(
//         children: [
//           TabBar(
//             isScrollable: true,
//             tabs: genre.map((e) => Tab(text: e.name)).toList(),
//             onTap: (index) => tmDbApply
//                 .getMoviesByGenre(genre[index].id ?? 0, page)
//                 .then((value) {
//               setState(() {
//                 moviesByGenre = value ?? [];
//               });
//             }),
//           ),
//           Container(
//             color: Colors.blueGrey.shade900,
//             width: double.infinity,
//             height: 250,
//             child: TabBarView(
//               children: [
//                 for (var i = 0; i < genre.length; i++)
//                   ListView.builder(
//                     controller: scrollController,
//                     scrollDirection: Axis.horizontal,
//                     itemCount: moviesByGenre.length,
//                     itemBuilder: (context, index) {
//                       return EasyScrollableWidget(
//                         index: index,
//                         genreMovies: moviesByGenre,
//                       );
//                     },
//                   ),
//               ],
//             ),
//           )
//         ],
//       ),
