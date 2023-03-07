import 'package:flutter/material.dart';
import '../data/apply/tmdb_apply.dart';
import '../data/apply/tmdb_apply_impl.dart';
import '../data/vos/get_credits_cast_vo/get_credits_cast_vo.dart';
import '../data/vos/get_credits_crew_vo/get_credits_crew_vo.dart';
import '../data/vos/get_details_vo/get_details_vo.dart';
import '../data/vos/get_now_playing_vo/get_now_playing_vo.dart';

class DetailPageBloc extends ChangeNotifier{
  //state variables
  bool _dispose=false;
  GetDetailsVO? _detailData;
  List<GetCreditsCastVO> _cast = [];
  List<GetCreditsCrewVO> _crew = [];
  List<GetNowPlayingVO> _similarMovies = [];
  int _similarMoviesPage = 1;


  //instance
  final TmdbApply detailApply = TmdbApplyImpl();
  final ScrollController similarMoviesScroll=ScrollController();


  //getter
  void get isDispose=>_dispose;

  GetDetailsVO? get gDetails=>_detailData;

  List<GetCreditsCastVO> get gCast=>_cast;

  List<GetCreditsCrewVO> get gCrew=>_crew;

  List<GetNowPlayingVO> get gSimilarMovies=>_similarMovies;



  //methods
  void addSimilarMovies(List<GetNowPlayingVO> toAdd){
    _similarMovies.addAll(toAdd);
    _similarMovies=_similarMovies.map((e) => e).toList();
    notifyListeners();
  }

  //constructor
  DetailPageBloc(int movieId){
    //controllers
    similarMoviesScroll.addListener(() {
      if(similarMoviesScroll.position.atEdge){
        if(similarMoviesScroll.position.pixels!=0){
          _similarMoviesPage++;
          detailApply.getSimilarMovies(movieId, _similarMoviesPage).then((value){
            final temp=value??[];
            if(temp.isNotEmpty){
              addSimilarMovies(temp);
            }
          });
        }
      }
    });
    //network call
    detailApply.getDetails(movieId)?.then((value) {
      _detailData = value;
      notifyListeners();
    });
    detailApply.getCast(movieId).then((value) {
      if(value!=null){
        _cast = value;
        notifyListeners();
      }
    });
    detailApply.getCrew(movieId).then((value) {
      if(value!=null){
        _crew = value;
        notifyListeners();
      }
    });
    detailApply.getSimilarMovies(movieId, _similarMoviesPage).then((value){
      if(value!=null){
        _similarMovies=value;
        notifyListeners();
      }
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
    super.dispose();
  }
}