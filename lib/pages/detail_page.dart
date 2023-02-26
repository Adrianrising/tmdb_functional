import 'package:flutter/material.dart';
import 'package:moviedb_functional/data/apply/tmdb_apply.dart';
import 'package:moviedb_functional/data/apply/tmdb_apply_impl.dart';
import 'package:moviedb_functional/data/vos/get_details_vo/get_details_vo.dart';
import 'package:moviedb_functional/data/vos/get_now_playing_vo/get_now_playing_vo.dart';
import 'package:moviedb_functional/easy_widget/easy_scroll_person_widget.dart';
import 'package:moviedb_functional/easy_widget/easy_scrollable_widget.dart';
import 'package:moviedb_functional/easy_widget/easy_text_widget.dart';
import 'package:moviedb_functional/utils/extension.dart';
import 'package:moviedb_functional/view_items/related_movies_section_view.dart';
import '../constant/colors.dart';
import '../constant/dimens.dart';
import '../constant/strings.dart';
import '../data/vos/get_credits_cast_vo/get_credits_cast_vo.dart';
import '../data/vos/get_credits_crew_vo/get_credits_crew_vo.dart';
import '../easy_widget/easy_cached_network_image.dart';
import '../view_items/about_film_left_side_view.dart';
import '../view_items/about_film_right_side_view.dart';
import '../view_items/movie_genres_name_and_run_time_view.dart';
import '../view_items/play_trailer_and_rate_movie_button_view.dart';
import '../view_items/sliver_app_bar_background_view.dart';
import '../view_items/sliver_app_bar_bottom_view.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, required this.movieId}) : super(key: key);

  final int movieId;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final TmdbApply detailApply = TmdbApplyImpl();
  GetDetailsVO? detailData;
  List<GetCreditsCastVO> cast = [];
  List<GetCreditsCrewVO> crew = [];

  @override
  void initState() {
    detailApply.getDetails(widget.movieId)?.then((value) {
      setState(() {
        detailData = value;
      });
    });
    detailApply.getCast(widget.movieId).then((value) {
      setState(() {
        cast = value ?? [];
      });
    });
    detailApply.getCrew(widget.movieId).then((value) {
      setState(() {
        crew = value ?? [];
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (widget.movieId == 0)
        ? Scaffold(
            body: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: SizedBox(
                  height: 300,
                  width: 300,
                  child: Center(
                    child: EasyTextWidget(
                      text:
                          'we are sorry!\nno detail available for this movie.\ntouch here to go back to home page.'
                              .toUpperCase(),
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          )
        : Scaffold(
            backgroundColor: Colors.black,
            body: (detailData == null)
                ? const Center(child: CircularProgressIndicator())
                : NestedScrollView(
                    headerSliverBuilder: (context, innerBoxIsScrolled) => [
                      SliverAppBar(
                        automaticallyImplyLeading: false,
                        expandedHeight: sliverAppBarHeight,
                        backgroundColor: kTransparentColor,
                        flexibleSpace: FlexibleSpaceBar(
                          collapseMode: CollapseMode.pin,
                          background: SliverAppBarBackgroundView(
                              detailData: detailData),
                        ),
                        bottom: PreferredSize(
                          preferredSize:
                              const Size.fromHeight(sliverBottomHeight),
                          child: SliverAppBarBottomView(detailData: detailData),
                        ),
                      )
                    ],
                    body: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          MovieGenresNameAndRunTimeView(detailData: detailData),
                          //story line title
                          Padding(
                            padding:
                                const EdgeInsets.only(left: sp10x, top: sp30x),
                            child: EasyTextWidget(
                              text: storyLineText,
                              color: Colors.grey.shade700,
                              fontSize: storyLineTextFontSize,
                            ),
                          ),

                          //overview
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: sp10x, right: sp10x, top: sp4x),
                              child: EasyTextWidget(
                                text: '${detailData?.overview}',
                                fontSize: fz17,
                              )),

                          const PlayTrailerAndRateMovieButtonsView(),

                          const SizedBox(
                            height: sp20x,
                          ),

                          //actors section
                          (cast.isEmpty)
                              ? const Center(child: CircularProgressIndicator())
                              : EasyScrollPersonWidget(
                                  cast: cast, leftTitle: actorText,color: Colors.black,),

                          //about film title
                          Padding(
                            padding: const EdgeInsets.all(sp15x),
                            child: EasyTextWidget(
                              text: aboutFilmText.toUpperCase(),
                              color: Colors.grey,
                              fontSize: aboutFilmTitleFontSize,
                            ),
                          ),

                          //about film content
                          Row(
                            children: [
                              const SizedBox(
                                width: sp15x,
                                height: sp200x,
                              ),
                              const AboutFilmLeftSideView(),
                              AboutFilmRightSideView(detailData: detailData)
                            ],
                          ),

                          //creators section
                          EasyScrollPersonWidget(
                            crew: crew,
                            leftTitle: creatorsText,
                            rightTitle: moreCreatorsText,
                            color: Colors.black,
                          ),

                          //related movie section
                          const Padding(
                            padding: EdgeInsets.only(
                                top: sp15x, bottom: sp20x, left: sp10x),
                            child: EasyTextWidget(
                              text: relatedMoviesText,
                              color: Colors.grey,
                              fontSize: relatedMovieTitleFontSize,
                            ),
                          ),
                          RelatedMoviesSectionView(movieId: widget.movieId),
                          const SizedBox(
                            height: sp30x,
                          ),
                        ],
                      ),
                    ),
                  ),
          );
  }
}
