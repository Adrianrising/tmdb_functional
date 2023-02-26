import 'package:flutter/material.dart';
import 'package:moviedb_functional/easy_widget/easy_text_widget.dart';

import '../constant/dimens.dart';
import '../constant/strings.dart';
import 'best_movie_scroll_view.dart';

class BestPopularMovieItemView extends StatelessWidget {
  const BestPopularMovieItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: bestMovieSectionHeight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: sp10x,bottom: sp8x),
            child: EasyTextWidget(text: bestMoviesTitle.toUpperCase(),fontSize: bestPopularMoviesTitleFontSize),
          ),
          const BestMovieScrollView(),
        ],
      ),
    );
  }
}

