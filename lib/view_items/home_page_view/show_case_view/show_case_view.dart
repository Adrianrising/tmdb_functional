import 'package:flutter/material.dart';
import 'package:moviedb_functional/bloc/home_page_bloc.dart';
import 'package:moviedb_functional/constant/colors.dart';
import 'package:moviedb_functional/constant/strings.dart';
import 'package:moviedb_functional/easy_widget/easy_scroll_person_widget.dart';
import 'package:provider/provider.dart';

import '../../../constant/dimens.dart';
import '../../../data/vos/get_now_playing_vo/get_now_playing_vo.dart';

class ShowCaseView extends StatelessWidget {
  const ShowCaseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<HomePageBloc, List<GetNowPlayingVO>>(
      selector: (_, obj) => obj.gPopularMovies,
      shouldRebuild: (previous, next) => previous != next,
      builder: (context, popularMovies, _) => EasyScrollPersonWidget(
        leftTitle: showCaseText,
        popularMovies: popularMovies,
        rightTitle: moreShowCaseText,
        height: showCaseSectionHeight,
        width: showCaseItemWidth,
        color: kTransparentColor,
      ),
    );
  }
}
