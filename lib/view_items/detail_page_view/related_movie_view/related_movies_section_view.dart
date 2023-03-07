import 'package:flutter/material.dart';
import 'package:moviedb_functional/bloc/detail_page_bloc.dart';
import 'package:provider/provider.dart';
import '../../../data/vos/get_now_playing_vo/get_now_playing_vo.dart';
import 'package:moviedb_functional/easy_widget/easy_scrollable_widget.dart';

class RelatedMoviesSectionView extends StatelessWidget {
  const RelatedMoviesSectionView({Key? key,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<DetailPageBloc,List<GetNowPlayingVO>>(
      selector: (_,obj)=>obj.gSimilarMovies,
      shouldRebuild: (previous,next)=>previous!=next,
      builder: (context, similarMovies, _) =>SizedBox(
        height: 250,
        child: (similarMovies.isEmpty)
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: similarMovies.length,
          controller: context.read<DetailPageBloc>().similarMoviesScroll,
          itemBuilder: (context, index) {
            return EasyScrollableWidget(
                index: index, movieList: similarMovies);
          },
        ),
      ) ,
    );
  }
}
