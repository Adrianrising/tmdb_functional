import 'package:moviedb_functional/data/apply/tmdb_apply.dart';
import 'package:moviedb_functional/data/vos/get_actors_vo/get_actors_vo.dart';
import 'package:moviedb_functional/data/vos/get_credits_cast_vo/get_credits_cast_vo.dart';
import 'package:moviedb_functional/data/vos/get_credits_crew_vo/get_credits_crew_vo.dart';
import 'package:moviedb_functional/data/vos/get_details_vo/get_details_vo.dart';
import 'package:moviedb_functional/data/vos/get_genres_vo/get_genres_vo.dart';
import 'package:moviedb_functional/data/vos/get_movies_by_genres_vo/get_movies_by_genres_vo.dart';
import 'package:moviedb_functional/data/vos/get_now_playing_vo/get_now_playing_vo.dart';
import 'package:moviedb_functional/network/data_agent/tmdb_data_agent/tmdb_data_agent.dart';
import 'package:moviedb_functional/network/data_agent/tmdb_data_agent/tmdb_data_agent_impl.dart';

class TmdbApplyImpl extends TmdbApply {
  TmdbApplyImpl._();

  static final TmdbApplyImpl _singleton = TmdbApplyImpl._();

  factory TmdbApplyImpl() => _singleton;
  final TmdbDataAgent _tmdbDataAgent = TmdbDataAgentImpl();

  @override
  Future<List<GetNowPlayingVO>?> getNowPlaying(int page) =>
      _tmdbDataAgent.getNowPlaying(page).then((value) {
        final temp = value?.map((e) {
          return e;
        }).toList();
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
        final temp = value;
        return temp;
      });

  @override
  Future<List<GetGenresVO>?> getGenres() =>
      _tmdbDataAgent.getGenres().then((value) {
        final temp = value;
        return temp;
      });

  @override
  Future<List<GetMoviesByGenresVO>?> getMoviesByGenre(int genreId, int page) =>
      _tmdbDataAgent.getMoviesByGenre(genreId, page).then((value) {
        final temp = value;
        return temp;
      });

  @override
  Future<List<GetNowPlayingVO>?> getPopularMovies(int page)=>
      _tmdbDataAgent.getPopularMovies(page).then((value){
        final temp=value;
        return temp;
      });

  @override
  Future<List<GetActorsVO>?> getActors(int page)=>
      _tmdbDataAgent.getActors(page).then((value){
        final temp=value;
        return temp;
      });
}
