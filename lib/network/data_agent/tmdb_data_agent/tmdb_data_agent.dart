import 'package:moviedb_functional/data/vos/get_actors_vo/get_actors_vo.dart';
import 'package:moviedb_functional/data/vos/get_now_playing_vo/get_now_playing_vo.dart';

import '../../../data/vos/get_credits_cast_vo/get_credits_cast_vo.dart';
import '../../../data/vos/get_credits_crew_vo/get_credits_crew_vo.dart';
import '../../../data/vos/get_details_vo/get_details_vo.dart';
import '../../../data/vos/get_genres_vo/get_genres_vo.dart';

abstract class TmdbDataAgent{

  Future<List<GetNowPlayingVO>?> getNowPlaying(int page);

  Future<GetDetailsVO>? getDetails(int movieId);

  Future<List<GetCreditsCastVO>?> getCast(int movieId);

  Future<List<GetCreditsCrewVO>?> getCrew(int movieId);

  Future<List<GetNowPlayingVO>?> getSimilarMovies(int movieId,int page);

  Future<List<GetGenresVO>?> getGenres();

  Future<List<GetNowPlayingVO>?> getMoviesByGenre(int genreId,int page);

  Future<List<GetNowPlayingVO>?> getPopularMovies(int page);

  Future<List<GetActorsVO>?> getActors(int page);
}