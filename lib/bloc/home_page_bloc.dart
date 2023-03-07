import 'package:flutter/material.dart';

import '../data/apply/tmdb_apply.dart';
import '../data/apply/tmdb_apply_impl.dart';
import '../data/vos/get_genres_vo/get_genres_vo.dart';
import '../data/vos/get_now_playing_vo/get_now_playing_vo.dart';

class HomePageBloc extends ChangeNotifier{
  //state variable
  bool _dispose=false;
  List<GetNowPlayingVO> _bestMovies=[];
  int _bestMoviePage=1;
  List<GetNowPlayingVO> _bannerMovies = [];

  List<GetGenresVO> _genre = [];
  List<GetNowPlayingVO> _moviesByGenre = [];
  int _genreMovieId = 0;
  int _genreMoviePage = 1;

  //  instance
  final TmdbApply tmdbApply = TmdbApplyImpl();
  final ScrollController bestMoviesScroll=ScrollController();
  final ScrollController genreMoviesScroll=ScrollController();

  //best movies getter
  bool get gDispose=>_dispose;
  List<GetNowPlayingVO> get gBestMovies => _bestMovies;
  int get gBestMoviePage=>_bestMoviePage;
  List<GetNowPlayingVO> get gBannerMovies=>_bannerMovies;
  //genre getter
  int get gGenreMovieId=>_genreMovieId;
  int get gGenreMoviePage=>_genreMoviePage;
  List<GetGenresVO> get gGenre=>_genre;
  List<GetNowPlayingVO> get gMovieByGenre=>_moviesByGenre;

  //methods
  void addBestMovies(List<GetNowPlayingVO> toAdd){
    _bestMovies.addAll(toAdd);
    _bestMovies=_bestMovies.map((e) => e).toList();
    notifyListeners();
  }

  void addGenreMovies(List<GetNowPlayingVO> toAdd){
    _moviesByGenre.addAll(toAdd);
    notifyListeners();
  }

  void bestMoviesIncrementPage()=>_bestMoviePage++;
  void genreMovieIncrementPage()=>_genreMoviePage++;

   //constructor
  HomePageBloc(){
    //scrollControllers
    bestMoviesScroll.addListener(() {
      if(bestMoviesScroll.position.atEdge){
        if(bestMoviesScroll.position.pixels!=0){
          _bestMoviePage++;
          tmdbApply.getNowPlaying(_bestMoviePage).then((value){
            final temp=value??[];
            if(temp.isNotEmpty){
              addBestMovies(temp);
            }
          });
        }
      }
    });
    //banner
    tmdbApply.getNowPlayingFromBoxAsStream(1).listen((event) {
      _bannerMovies=(event?.take(5).toList())??[];
      notifyListeners();
    });
    //best movie
    // tmdbApply.getNowPlayingFromBoxAsStream(_bestMoviePage).listen((event) {
    //   _bestMovies=event??[];
    //   notifyListeners();
    // });
    tmdbApply.getNowPlaying(_bestMoviePage).then((value){
      _bestMovies=value??[];
      notifyListeners();
    });

    //movies by genre


  }

  @override
  void notifyListeners() {
    if(!_dispose){
      super.notifyListeners();
    }
  }
  @override
  void dispose() {
    _dispose=true;
    // TODO: implement dispose
    super.dispose();
  }


}