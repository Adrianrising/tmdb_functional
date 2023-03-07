import 'package:flutter/material.dart';
import 'package:moviedb_functional/constant/dimens.dart';
import 'package:moviedb_functional/easy_widget/easy_cached_network_image.dart';
import 'package:moviedb_functional/easy_widget/easy_text_widget.dart';
import 'package:moviedb_functional/pages/detail_page.dart';
import 'package:moviedb_functional/utils/extension.dart';
import '../data/vos/get_now_playing_vo/get_now_playing_vo.dart';
import 'easy_rating_bar_widget.dart';

class EasyScrollableWidget extends StatelessWidget {
  const EasyScrollableWidget(
      {super.key,
      required this.index,
      this.movieList = const [],
      this.genreMovies = const []});

  final int index;
  final List<GetNowPlayingVO> movieList;
  final List<GetNowPlayingVO> genreMovies;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: easyScrollWidth,
      height: easyScrollHeight,
      margin: const EdgeInsets.symmetric(
        horizontal: sp10x,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
              //movie poster
              child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailPage(
                      movieId: (movieList.isNotEmpty)
                          ? movieList[index].id ?? 0
                          : genreMovies[index].id ?? 0)));
            },
            child: EasyCachedNetworkImage(
              img: (movieList.isNotEmpty)
                  ? (movieList[index].backdropPath ?? "").completeImage()
                  : (genreMovies[index].backdropPath ?? "").completeImage(),
            ),
          )),
          //movie title
          EasyTextWidget(
              text: (movieList.isNotEmpty)
                  ? '${movieList[index].originalTitle}'
                  : '${genreMovies[index].originalTitle}',
              fontSize: fz17),

          //rating section
          Row(
            children: [
              EasyTextWidget(
                  text: (movieList.isNotEmpty)
                      ? '${movieList[index].voteAverage}'
                      : '${genreMovies[index].voteAverage}',
                  fontSize: fz15),
              const SizedBox(
                width: sp10x,
              ),
              EasyRatingBarWidget(
                  rating: ((movieList.isNotEmpty)
                          ? movieList[index].voteAverage ?? 0
                          : genreMovies[index].voteAverage ?? 0) /
                      2),
            ],
          )
        ],
      ),
    );
  }
}
