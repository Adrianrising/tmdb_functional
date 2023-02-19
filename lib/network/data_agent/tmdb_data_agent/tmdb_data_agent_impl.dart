import 'package:dio/dio.dart';
import 'package:moviedb_functional/constant/api_constant.dart';
import 'package:moviedb_functional/data/vos/get_actors_vo/get_actors_vo.dart';
import 'package:moviedb_functional/data/vos/get_credits_cast_vo/get_credits_cast_vo.dart';
import 'package:moviedb_functional/data/vos/get_credits_crew_vo/get_credits_crew_vo.dart';
import 'package:moviedb_functional/data/vos/get_details_vo/get_details_vo.dart';
import 'package:moviedb_functional/data/vos/get_genres_vo/get_genres_vo.dart';
import 'package:moviedb_functional/data/vos/get_movies_by_genres_vo/get_movies_by_genres_vo.dart';
import 'package:moviedb_functional/data/vos/get_now_playing_vo/get_now_playing_vo.dart';
import 'package:moviedb_functional/network/data_agent/tmdb_data_agent/tmdb_data_agent.dart';

import '../../api/tmdb_api/tmdb_api.dart';

class TmdbDataAgentImpl extends TmdbDataAgent{
  late TmdbApi _tmdbApi;
  TmdbDataAgentImpl._(){
    _tmdbApi=TmdbApi(Dio());
  }
  static final TmdbDataAgentImpl _singleton=TmdbDataAgentImpl._();
  factory TmdbDataAgentImpl()=>_singleton;
  @override
  Future<List<GetNowPlayingVO>?> getNowPlaying(int page)=>_tmdbApi
      .getNowPlaying(kApiKey, page)
      .asStream()
      .map((event) => event.results)
      .first;

  @override
  Future<GetDetailsVO>? getDetails(int movieId)=>_tmdbApi
      .getDetails(kApiKey, movieId)
      .asStream()
      .first;

  @override
  Future<List<GetCreditsCastVO>?> getCast(int movieId)=>_tmdbApi
      .getCredits(kApiKey, movieId)
      .asStream()
      .map((event) => event.cast)
      .first;

  @override
  Future<List<GetCreditsCrewVO>?> getCrew(int movieId)=>_tmdbApi
      .getCredits(kApiKey, movieId)
      .asStream()
      .map((event) => event.crew)
      .first;

  @override
  Future<List<GetNowPlayingVO>?> getSimilarMovies(int movieId, int page)=>_tmdbApi
      .getSimilarMovies(movieId, kApiKey, page)
      .asStream()
      .map((event) => event.results)
      .first;

  @override
  Future<List<GetGenresVO>?> getGenres()=>_tmdbApi
      .getGenres(kApiKey)
      .asStream()
      .map((event)=>event.genres)
      .first;

  @override
  Future<List<GetMoviesByGenresVO>?> getMoviesByGenre(int genreId, int page)=>_tmdbApi
      .getMoviesByGenre(genreId, kApiKey, page)
      .asStream()
      .map((event) => event.results)
      .first;

  @override
  Future<List<GetNowPlayingVO>?> getPopularMovies(int page)=>_tmdbApi
      .getPopularMovies(kApiKey, page)
      .asStream()
      .map((event) => event.results)
      .first;

  @override
  Future<List<GetActorsVO>?> getActors(int page)=>_tmdbApi
      .getActors(kApiKey, page)
      .asStream()
      .map((event) => event.results)
      .first;
}

