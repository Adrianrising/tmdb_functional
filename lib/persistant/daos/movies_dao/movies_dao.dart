import '../../../data/vos/get_now_playing_vo/get_now_playing_vo.dart';

abstract class MoviesDAO{
  void moviesToBox(List<GetNowPlayingVO> movies);
  List<GetNowPlayingVO>? moviesFromBox();

  void clearAllData();

  Stream watchBox();
  Stream<List<GetNowPlayingVO>?> moviesFromBoxAsStream();
}