import 'package:flutter/material.dart';
import 'package:moviedb_functional/bloc/home_page_bloc.dart';
import 'package:moviedb_functional/constant/colors.dart';
import 'package:moviedb_functional/easy_widget/easy_text_widget.dart';
import 'package:moviedb_functional/pages/detail_page.dart';
import 'package:moviedb_functional/utils/extension.dart';
import 'package:provider/provider.dart';
import '../constant/dimens.dart';
import '../data/vos/get_actors_vo/get_actors_vo.dart';
import '../data/vos/get_credits_cast_vo/get_credits_cast_vo.dart';
import '../data/vos/get_credits_crew_vo/get_credits_crew_vo.dart';
import '../data/vos/get_now_playing_vo/get_now_playing_vo.dart';
import '../easy_widget/easy_cached_network_image.dart';

class EasyScrollPersonWidget extends StatelessWidget {
  const EasyScrollPersonWidget(
      {super.key,
      required this.leftTitle,
      this.rightTitle = "",
      this.cast = const [],
      this.crew = const [],
      this.popularMovies = const [],
      this.width = 200,
      this.height = 300,
      this.color = kPrimaryColor,
      this.actors = const []});

  final List<GetCreditsCastVO> cast;
  final List<GetCreditsCrewVO> crew;
  final List<GetNowPlayingVO> popularMovies;
  final List<GetActorsVO> actors;
  final String leftTitle;
  final String rightTitle;
  final double height;
  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          //title
          Padding(
            padding: const EdgeInsets.only(
                left: sp10x, top: sp10x, bottom: sp15x, right: sp10x),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                EasyTextWidget(
                    text: leftTitle.toUpperCase(),
                    fontSize: titleFontSize,
                    color: Colors.grey.shade700),
                EasyTextWidget(
                    text: rightTitle.toUpperCase(),
                    fontSize: titleFontSize,
                    color: Colors.white),
              ],
            ),
          ),
          //scroll
          Expanded(
            child: ListView.builder(
              controller: (popularMovies.isNotEmpty)
                  ? context.read<HomePageBloc>().popularMoviesScroll
                  : (actors.isNotEmpty)
                      ? context.read<HomePageBloc>().bestActorsScroll
                      : null,
              scrollDirection: Axis.horizontal,
              itemCount: (cast.isNotEmpty)
                  ? cast.length
                  : (crew.isNotEmpty)
                      ? crew.length
                      : (popularMovies.isNotEmpty)
                          ? popularMovies.length
                          : actors.length,
              itemBuilder: (context, index) {
                //scroll item
                return Container(
                  margin: const EdgeInsets.only(
                      left: 10, right: sp3x, bottom: sp40x),
                  width: width,
                  child: GestureDetector(
                    onTap: (popularMovies.isNotEmpty)
                        ? () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetailPage(
                                  movieId: popularMovies[index].id ?? 0),
                            ));
                          }
                        : () {},
                    child: Stack(
                      children: [
                        Positioned.fill(
                            child: EasyCachedNetworkImage(
                                img: (cast.isNotEmpty)
                                    ? (cast[index].profilePath ?? "")
                                        .completeImage()
                                    : (crew.isNotEmpty)
                                        ? (crew[index].profilePath ?? "")
                                            .completeImage()
                                        : (popularMovies.isNotEmpty)
                                            ? (popularMovies[index]
                                                        .backdropPath ??
                                                    "")
                                                .completeImage()
                                            : (actors[index]
                                                        .profilePath ??
                                                    "")
                                                .completeImage())),
                        Padding(
                          padding: const EdgeInsets.only(left: sp10x, bottom: sp20x),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: EasyTextWidget(
                              text: (cast.isNotEmpty)
                                  ? '${cast[index].name}\nas\n${cast[index].character}'
                                  : (crew.isNotEmpty)
                                      ? '${crew[index].name}\nas\n${crew[index].job}'
                                      : (popularMovies.isNotEmpty)
                                          ? '${popularMovies[index].originalTitle}\nreleased in\n${popularMovies[index].releaseDate}'
                                          : '${actors[index].name}\npopularity ${actors[index].popularity}',
                              fontSize: 20,
                            ),
                          ),
                        ),
                        (popularMovies.isNotEmpty)
                            ? const Center(
                                child: Icon(Icons.play_circle,
                                    color: Colors.amber, size: 60),
                              )
                            : const Positioned(
                                top: sp5x,
                                right: sp5x,
                                child: Icon(
                                  Icons.favorite_outline,
                                  color: Colors.redAccent,
                                  size: 40,
                                ),
                              ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
