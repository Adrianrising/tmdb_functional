import 'package:flutter/material.dart';

import '../data/apply/tmdb_apply.dart';
import '../data/apply/tmdb_apply_impl.dart';
import '../data/vos/get_actors_vo/get_actors_vo.dart';
import '../data/vos/get_genres_vo/get_genres_vo.dart';
import '../data/vos/get_now_playing_vo/get_now_playing_vo.dart';

class HomePageBloc extends ChangeNotifier{
  //state variable
  bool _dispose=false;
  //best movies
  List<GetNowPlayingVO> _bestMovies=[];
  int _bestMoviePage=1;
  //banner
  List<GetNowPlayingVO> _bannerMovies = [];
  //movies by genre
  List<GetGenresVO> _genre = [];
  List<GetNowPlayingVO> _moviesByGenre = [];
  int _genreMovieId = 0;
  int _genreMoviePage = 1;

  //popular movies
  int _popularMoviesPage=1;
  List<GetNowPlayingVO> _popularMovies=[];

  //best actors
  int _bestActorsPage=1;
  List<GetActorsVO> _bestActors = [];

  //  instance
  final TmdbApply tmdbApply = TmdbApplyImpl();
  final PageController bannerScroll = PageController();
  final ScrollController bestMoviesScroll=ScrollController();
  final ScrollController genreMoviesScroll=ScrollController();
  final ScrollController popularMoviesScroll=ScrollController();
  final ScrollController bestActorsScroll=ScrollController();

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

  //show case getter
  int get gPopularMoviesPage=>_popularMoviesPage;
  List<GetNowPlayingVO> get gPopularMovies=>_popularMovies;

  //best actors getter
  int get gBestActorsPage=>_bestActorsPage;
  List<GetActorsVO> get gBestActors=>_bestActors;

  //methods
  void addBestMovies(List<GetNowPlayingVO> toAdd){
    _bestMovies.addAll(toAdd);
    _bestMovies=_bestMovies.map((e) => e).toList();
    notifyListeners();
  }

  void addGenreMovies(List<GetNowPlayingVO> toAdd){
    _moviesByGenre.addAll(toAdd);
    _moviesByGenre=_moviesByGenre.map((e) => e).toList();
    notifyListeners();
  }

  void onTapReplaceGenreMovies(List<GetNowPlayingVO> toAdd){
    _moviesByGenre=toAdd;
    notifyListeners();
  }


  void onTapGenre(int index){
    tmdbApply.getMoviesByGenre(_genre[index].id??0, _genreMoviePage)
        .then((value){
          onTapReplaceGenreMovies(value??[]);
    });
  }

  void addPopularMovies(List<GetNowPlayingVO> toAdd){
    _popularMovies.addAll(toAdd);
    _popularMovies=_popularMovies.map((e) => e).toList();
    notifyListeners();
  }

  void addBestActors(List<GetActorsVO> toAdd){
    _bestActors.addAll(toAdd);
    _bestActors=_bestActors.map((e) => e).toList();
    notifyListeners();
  }

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

    popularMoviesScroll.addListener(() {
      if(popularMoviesScroll.position.atEdge){
        if(popularMoviesScroll.position.pixels!=0){
          _popularMoviesPage++;
          tmdbApply.getPopularMovies(_popularMoviesPage).then((value){
            final temp=value??[];
            if(temp.isNotEmpty){
              addPopularMovies(temp);
            }
          });
        }
      }
    });

    bestActorsScroll.addListener(() {
      if(bestActorsScroll.position.atEdge){
        if(bestActorsScroll.position.pixels!=0){
          _bestActorsPage++;
          tmdbApply.getActors(_bestActorsPage).then((value){
            final temp=value??[];
            if(temp.isNotEmpty){
              addBestActors(temp);
            }
          });
        }
      }
    });

    genreMoviesScroll.addListener(() {
      if(genreMoviesScroll.position.atEdge){
        if(genreMoviesScroll.position.pixels!=0){
          _genreMoviePage++;
          tmdbApply.getMoviesByGenre(_genreMovieId, _genreMoviePage).then((value){
            final temp=value??[];
            if(temp.isNotEmpty){
              addGenreMovies(temp);
            }
          });
        }
      }
    });
    //network call
    // banner
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
    tmdbApply.getGenres().then((value){
      _genre=value??[];
      _genreMovieId=_genre[0].id??0;
      tmdbApply.getMoviesByGenre(_genreMovieId, _genreMoviePage).then((value){
        _moviesByGenre=value??[];
        notifyListeners();
      });
    });
    //popular movies
    tmdbApply.getPopularMoviesFromBoxAsStream(_popularMoviesPage).listen((event) {
      _popularMovies=event??[];
      notifyListeners();
    });

    //best actors
    tmdbApply.getActorsFromBoxAsStream(_bestActorsPage).listen((event) {
      _bestActors=event??[];
      notifyListeners();
    });

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
    bestMoviesScroll.dispose();
    genreMoviesScroll.dispose();
    popularMoviesScroll.dispose();
    bestActorsScroll.dispose();
    // TODO: implement dispose
    super.dispose();
  }


}