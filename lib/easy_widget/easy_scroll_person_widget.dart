import 'package:flutter/material.dart';
import 'package:moviedb_functional/constant/colors.dart';
import 'package:moviedb_functional/data/apply/tmdb_apply.dart';
import 'package:moviedb_functional/data/apply/tmdb_apply_impl.dart';
import 'package:moviedb_functional/easy_widget/easy_text_widget.dart';
import 'package:moviedb_functional/pages/detail_page.dart';
import 'package:moviedb_functional/utils/extension.dart';
import '../constant/dimens.dart';
import '../data/vos/get_actors_vo/get_actors_vo.dart';
import '../data/vos/get_credits_cast_vo/get_credits_cast_vo.dart';
import '../data/vos/get_credits_crew_vo/get_credits_crew_vo.dart';
import '../data/vos/get_now_playing_vo/get_now_playing_vo.dart';
import '../easy_widget/easy_cached_network_image.dart';

class EasyScrollPersonWidget extends StatefulWidget {
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
  State<EasyScrollPersonWidget> createState() => _EasyScrollPersonWidgetState();
}

class _EasyScrollPersonWidgetState extends State<EasyScrollPersonWidget> {
  final ScrollController scrollController = ScrollController();
  final ScrollController controllerThatDoesNothing = ScrollController();
  final ScrollController controllerForActors = ScrollController();
  final TmdbApply tmdDbApply = TmdbApplyImpl();
  int page = 1;
  int actorPage = 1;

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          page++;
          tmdDbApply.getPopularMovies(page).then((value) {
            final temp = value ?? [];
            if (temp.isNotEmpty) {
              for (var element in temp) {
                widget.popularMovies.add(element);
              }
              setState(() {});
            }
          });
        }
      }
    });
    controllerForActors.addListener(() {
      if (controllerForActors.position.atEdge) {
        if (controllerForActors.position.pixels != 0) {
          actorPage++;
          tmdDbApply.getActors(actorPage).then((value) {
            final temp = value ?? [];
            if (temp.isNotEmpty) {
              for (var element in temp) {
                widget.actors.add(element);
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
    controllerThatDoesNothing.dispose();
    controllerForActors.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.color,
      height: widget.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: sp10x, top: sp10x, bottom: sp15x, right: sp10x),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                EasyTextWidget(
                    text: widget.leftTitle.toUpperCase(),
                    fontSize: titleFontSize,
                    color: Colors.grey.shade700),
                EasyTextWidget(
                    text: widget.rightTitle.toUpperCase(),
                    fontSize: titleFontSize,
                    color: Colors.white),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: (widget.popularMovies.isNotEmpty)
                  ? scrollController
                  : (widget.actors.isNotEmpty)
                      ? controllerForActors
                      : controllerThatDoesNothing,
              scrollDirection: Axis.horizontal,
              itemCount: (widget.cast.isNotEmpty)
                  ? widget.cast.length
                  : (widget.crew.isNotEmpty)
                      ? widget.crew.length
                      : (widget.popularMovies.isNotEmpty)
                          ? widget.popularMovies.length
                          : widget.actors.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(
                      left: 10, right: sp3x, bottom: sp40x),
                  width: widget.width,
                  child: GestureDetector(
                    onTap: (widget.popularMovies.isNotEmpty)
                        ? () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetailPage(
                                  movieId: widget.popularMovies[index].id ?? 0),
                            ));
                          }
                        : () {},
                    child: Stack(
                      children: [
                        Positioned.fill(
                            child: EasyCachedNetworkImage(
                                img: (widget.cast.isNotEmpty)
                                    ? (widget.cast[index].profilePath ?? "")
                                        .completeImage()
                                    : (widget.crew.isNotEmpty)
                                        ? (widget.crew[index].profilePath ?? "")
                                            .completeImage()
                                        : (widget.popularMovies.isNotEmpty)
                                            ? (widget.popularMovies[index]
                                                        .backdropPath ??
                                                    "")
                                                .completeImage()
                                            : (widget.actors[index]
                                                        .profilePath ??
                                                    "")
                                                .completeImage())),
                        Padding(
                          padding: const EdgeInsets.only(left: sp10x, bottom: sp20x),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: EasyTextWidget(
                              text: (widget.cast.isNotEmpty)
                                  ? '${widget.cast[index].name}\nas\n${widget.cast[index].character}'
                                  : (widget.crew.isNotEmpty)
                                      ? '${widget.crew[index].name}\nas\n${widget.crew[index].job}'
                                      : (widget.popularMovies.isNotEmpty)
                                          ? '${widget.popularMovies[index].originalTitle}\nreleased in\n${widget.popularMovies[index].releaseDate}'
                                          : '${widget.actors[index].name}\npopularity ${widget.actors[index].popularity}',
                              fontSize: 20,
                            ),
                          ),
                        ),
                        (widget.popularMovies.isNotEmpty)
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
