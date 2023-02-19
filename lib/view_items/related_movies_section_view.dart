
import 'package:flutter/material.dart';
import 'package:moviedb_functional/data/apply/tmdb_apply.dart';
import 'package:moviedb_functional/data/apply/tmdb_apply_impl.dart';
import '../data/vos/get_now_playing_vo/get_now_playing_vo.dart';
import 'package:moviedb_functional/easy_widget/easy_scrollable_widget.dart';
class RelatedMoviesSectionView extends StatefulWidget {
  const RelatedMoviesSectionView({Key? key, required this.movieId}) : super(key: key);
  final int movieId;

  @override
  State<RelatedMoviesSectionView> createState() => _RelatedMoviesSectionViewState();
}

class _RelatedMoviesSectionViewState extends State<RelatedMoviesSectionView> {
  final TmdbApply tmdbApply=TmdbApplyImpl();
  final ScrollController _scrollController=ScrollController();
  List<GetNowPlayingVO> similarMovies = [];
  int page = 1;

  @override
  void initState() {
    tmdbApply.getSimilarMovies(widget.movieId, page).then((value) {
      setState(() {
        similarMovies = value ?? [];
      });
    });
    _scrollController.addListener(() {
      if(_scrollController.position.atEdge){
        if(_scrollController.position.pixels!=0){
          page++;
          tmdbApply.getSimilarMovies(widget.movieId, page).then((value){
            final temp=value??[];
            if(temp.isNotEmpty){
              for(var element in temp){
                similarMovies.add(element);
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
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: (similarMovies.isEmpty)
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: similarMovies.length,
        controller: _scrollController,
        itemBuilder: (context, index) {
          return EasyScrollableWidget(
              index: index, movieList: similarMovies);
        },
      ),
    );
  }
}
