
import 'package:flutter/material.dart';
import 'package:moviedb_functional/data/apply/tmdb_apply_impl.dart';
import '../data/apply/tmdb_apply.dart';
import '../data/vos/get_now_playing_vo/get_now_playing_vo.dart';
import '../easy_widget/easy_scrollable_widget.dart';

class BestMovieScrollView extends StatefulWidget {
  const BestMovieScrollView({
    super.key,
  });

  @override
  State<BestMovieScrollView> createState() => _BestMovieScrollViewState();
}

class _BestMovieScrollViewState extends State<BestMovieScrollView> {
  final TmdbApply tmdbApply = TmdbApplyImpl();
  final ScrollController scrollController = ScrollController();
  List<GetNowPlayingVO> bestMovies = [];
  int page=1;

  @override
  void initState() {
    tmdbApply.getNowPlaying(page).then((value) {
      setState(() {
        bestMovies = value ?? [];
      });
    });

    scrollController.addListener(() {
      if(scrollController.position.atEdge){
        if(scrollController.position.pixels!=0){
          page++;
          tmdbApply.getNowPlaying(page).then((value){
            final temp=value??[];
            if(temp.isNotEmpty){
              for (var element in temp) {
                bestMovies.add(element);
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
    return Expanded(
      child: bestMovies.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: bestMovies.length,
              controller: scrollController,
              itemBuilder: (context, index) {
                return EasyScrollableWidget(movieList: bestMovies,index: index);
              },
            ),
    );
  }
}


