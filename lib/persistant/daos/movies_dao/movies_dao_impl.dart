import 'package:hive/hive.dart';
import 'package:moviedb_functional/data/vos/get_now_playing_vo/get_now_playing_vo.dart';
import 'package:moviedb_functional/persistant/daos/movies_dao/movies_dao.dart';

import '../../../constant/hive_constant.dart';

class MoviesDAOImpl extends MoviesDAO {
  MoviesDAOImpl._();

  static final MoviesDAOImpl _singleton = MoviesDAOImpl._();

  factory MoviesDAOImpl()=> _singleton;

  Box<GetNowPlayingVO> _getMoviesBox() =>
      Hive.box<GetNowPlayingVO>(kMoviesBoxName);

  @override
  List<GetNowPlayingVO>? moviesFromBox() => _getMoviesBox().values.toList();

  @override
  void moviesToBox(List<GetNowPlayingVO> movies) {
    movies.forEach((element) {
      _getMoviesBox().put(element.id, element);
    });
  }

  @override
  Stream<List<GetNowPlayingVO>?> moviesFromBoxAsStream()=>Stream.value(moviesFromBox());

  @override
  Stream watchBox() => _getMoviesBox().watch();

  @override
  void clearAllData()=>_getMoviesBox().clear();

}