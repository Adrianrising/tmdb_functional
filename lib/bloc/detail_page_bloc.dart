import 'package:flutter/foundation.dart';

import '../data/apply/tmdb_apply.dart';
import '../data/apply/tmdb_apply_impl.dart';
import '../data/vos/get_credits_cast_vo/get_credits_cast_vo.dart';
import '../data/vos/get_credits_crew_vo/get_credits_crew_vo.dart';
import '../data/vos/get_details_vo/get_details_vo.dart';

class DetailPageBloc extends ChangeNotifier{
  //attributes
  bool _dispose=false;
  GetDetailsVO? _detailData;
  List<GetCreditsCastVO> _cast = [];
  List<GetCreditsCrewVO> _crew = [];

  //getter
  void get isDispose=>_dispose;

  GetDetailsVO? get gDetails=>_detailData;

  List<GetCreditsCastVO> get gCast=>_cast;

  List<GetCreditsCrewVO> get gCrew=>_crew;

  //instance
  final TmdbApply detailApply = TmdbApplyImpl();

  //constructor
  DetailPageBloc(int movieId){
    detailApply.getDetails(movieId)?.then((value) {
      _detailData = value;
      notifyListeners();
    });
    detailApply.getCast(movieId).then((value) {
      if(value!=null){
        _cast = value ?? [];
        notifyListeners();
      }
    });
    detailApply.getCrew(movieId).then((value) {
      if(value!=null){
        _crew = value ?? [];
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