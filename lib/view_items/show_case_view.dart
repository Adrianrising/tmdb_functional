import 'package:flutter/material.dart';
import 'package:moviedb_functional/constant/colors.dart';
import 'package:moviedb_functional/constant/strings.dart';
import 'package:moviedb_functional/data/apply/tmdb_apply.dart';
import 'package:moviedb_functional/data/apply/tmdb_apply_impl.dart';
import 'package:moviedb_functional/easy_widget/easy_scroll_person_widget.dart';

import '../constant/dimens.dart';
import '../data/vos/get_now_playing_vo/get_now_playing_vo.dart';

class ShowCaseView extends StatefulWidget {
  const ShowCaseView({Key? key}) : super(key: key);

  @override
  State<ShowCaseView> createState() => _ShowCaseViewState();
}

class _ShowCaseViewState extends State<ShowCaseView> {
  final TmdbApply tmdDbApply = TmdbApplyImpl();

  int page = 1;
  List<GetNowPlayingVO> popularMovies = [];

  @override
  void initState() {
    // tmdDbApply.getPopularMovies(page).then((value) {
    //   setState(() {
    //     popularMovies = value ?? [];
    //   });
    // });
    tmdDbApply.getPopularMoviesFromBoxAsStream(page).listen((event) {
      if(mounted){
        setState(() {
          popularMovies=event??[];
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return EasyScrollPersonWidget(
      leftTitle: showCaseText,
      popularMovies: popularMovies,
      rightTitle: moreShowCaseText,
      height: showCaseSectionHeight,
      width: showCaseItemWidth,
      color: kTransparentColor,
    );
  }
}
