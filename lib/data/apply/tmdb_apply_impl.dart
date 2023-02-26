import 'package:moviedb_functional/data/apply/tmdb_apply.dart';
import 'package:moviedb_functional/data/vos/get_actors_vo/get_actors_vo.dart';
import 'package:moviedb_functional/data/vos/get_credits_cast_vo/get_credits_cast_vo.dart';
import 'package:moviedb_functional/data/vos/get_credits_crew_vo/get_credits_crew_vo.dart';
import 'package:moviedb_functional/data/vos/get_details_vo/get_details_vo.dart';
import 'package:moviedb_functional/data/vos/get_genres_vo/get_genres_vo.dart';
import 'package:moviedb_functional/data/vos/get_now_playing_vo/get_now_playing_vo.dart';
import 'package:moviedb_functional/network/data_agent/tmdb_data_agent/tmdb_data_agent.dart';
import 'package:moviedb_functional/network/data_agent/tmdb_data_agent/tmdb_data_agent_impl.dart';
import 'package:moviedb_functional/persistant/daos/get_actors_dao/get_actors_dao.dart';
import 'package:moviedb_functional/persistant/daos/get_actors_dao/get_actors_dao_impl.dart';
import 'package:moviedb_functional/persistant/daos/movies_dao/movies_dao_impl.dart';
import 'package:stream_transform/stream_transform.dart';
import '../../persistant/daos/movies_dao/movies_dao.dart';


class TmdbApplyImpl extends TmdbApply {
  TmdbApplyImpl._();

  static final TmdbApplyImpl _singleton = TmdbApplyImpl._();

  factory TmdbApplyImpl() => _singleton;
  final TmdbDataAgent _tmdbDataAgent = TmdbDataAgentImpl();
  final MoviesDAO _moviesDAO=MoviesDAOImpl();
  final GetActorsDAO _actorsDAO=GetActorsDAOImpl();

  //network
  @override
  Future<List<GetNowPlayingVO>?> getNowPlaying(int page) =>
      _tmdbDataAgent.getNowPlaying(page).then((value) {
        final temp = value?.map((e) {
          e.getNowPlaying=true;
          return e;
        }).toList();
        _moviesDAO.moviesToBox(temp??[]);
        return temp;
      });

  @override
  Future<GetDetailsVO>? getDetails(int movieId) =>
      _tmdbDataAgent.getDetails(movieId)?.then((value) {
        final temp = value;
        return temp;
      });

  @override
  Future<List<GetCreditsCastVO>?> getCast(int movieId) =>
      _tmdbDataAgent.getCast(movieId).then((value) {
        final temp = value;
        return temp;
      });

  @override
  Future<List<GetCreditsCrewVO>?> getCrew(int movieId) =>
      _tmdbDataAgent.getCrew(movieId).then((value) {
        final temp = value;
        return temp;
      });

  @override
  Future<List<GetNowPlayingVO>?> getSimilarMovies(int movieId, int page) =>
      _tmdbDataAgent.getSimilarMovies(movieId, page).then((value) {
        final temp = value?.map((e){
          e.getSimilarMovies=true;
          return e;
        }).toList();
        _moviesDAO.moviesToBox(temp??[]);
        return temp;
      });

  @override
  Future<List<GetGenresVO>?> getGenres() =>
      _tmdbDataAgent.getGenres().then((value) {
        final temp = value;
        return temp;
      });

  @override
  Future<List<GetNowPlayingVO>?> getMoviesByGenre(int genreId, int page) =>
      _tmdbDataAgent.getMoviesByGenre(genreId, page).then((value) {
        final temp = value?.map((e){
          e.getMoviesByGenre=true;
          return e;
        }).toList();
        // _moviesDAO.moviesToBox(temp??[]);
        return temp;
      });

  @override
  Future<List<GetNowPlayingVO>?> getPopularMovies(int page)=>
      _tmdbDataAgent.getPopularMovies(page).then((value){
        final temp=value?.map((e){
          e.getPopularMovies=true;
          return e;
        }).toList();
        _moviesDAO.moviesToBox(temp??[]);
        return temp;
      });

  @override
  Future<List<GetActorsVO>?> getActors(int page)=>
      _tmdbDataAgent.getActors(page).then((value){
        final temp=value;
        _actorsDAO.actorsToBox(temp??[]);
        return temp;
      });

  @override
  Stream<List<GetNowPlayingVO>?> getNowPlayingFromBoxAsStream(int page) {
    getNowPlaying(page);
    return _moviesDAO
        .watchBox()
        .startWith(_moviesDAO.moviesFromBoxAsStream())
        .map((event) => _moviesDAO.moviesFromBox()?.where((element) => element.getNowPlaying??true).toList());
  }

  @override
  Stream<List<GetNowPlayingVO>?> getSimilarMoviesFromBoxAsStream(int movieId,int page) {
    getSimilarMovies(movieId, page);
    return _moviesDAO
        .watchBox()
        .startWith(_moviesDAO.moviesFromBoxAsStream())
        .map((event) => _moviesDAO.moviesFromBox()?.where((element) => element.getSimilarMovies??true).toList());
  }

  @override
  Stream<List<GetNowPlayingVO>?> getPopularMoviesFromBoxAsStream(int page) {
    getPopularMovies(page);
    return _moviesDAO
        .watchBox()
        .startWith(_moviesDAO.moviesFromBoxAsStream())
        .map((event) => _moviesDAO.moviesFromBox()?.where((element) => element.getPopularMovies??true).toList());
  }

  @override
  Stream<List<GetNowPlayingVO>?> getMoviesByGenreFromBoxAsStream(int genreId, int page) {
    getMoviesByGenre(genreId, page);
    return _moviesDAO
        .watchBox()
        .startWith(_moviesDAO.moviesFromBoxAsStream())
        .map((event) => _moviesDAO.moviesFromBox()?.where((element) => element.getMoviesByGenre??true).toList());
  }

  @override
  Stream<List<GetActorsVO>?> getActorsFromBoxAsStream(int page) {
    getActors(page);
    return _actorsDAO
        .watchBox()
        .startWith(_actorsDAO.actorsFromBoxAsStream())
        .map((event) => _actorsDAO.actorsFromBox());
  }








}
