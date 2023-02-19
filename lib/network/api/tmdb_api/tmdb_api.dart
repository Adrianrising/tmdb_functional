import 'package:dio/dio.dart';
import 'package:moviedb_functional/constant/api_constant.dart';
import 'package:moviedb_functional/network/response/get_now_playing_response/get_now_playing_response.dart';
import 'package:retrofit/http.dart';

import '../../../data/vos/get_details_vo/get_details_vo.dart';
import '../../response/get_actors_response/get_actors_response.dart';
import '../../response/get_credits_response/get_credits_response.dart';
import '../../response/get_genres_response/get_genres_response.dart';
import '../../response/get_movies_by_genres_response/get_movies_by_genres_response.dart';
import '../../response/get_popular_movies_response/get_popular_movies_response.dart';
part 'tmdb_api.g.dart';
@RestApi(baseUrl: kBaseUrl)
abstract class TmdbApi{

  factory TmdbApi(Dio dio)=_TmdbApi;

  @GET(kGetNowPlayingEndPoint)

  Future<GetNowPlayingResponse>getNowPlaying(
      @Query(kApi) String api,
      @Query(kPage) int page
      );

  @GET(kGetDetailsEndPoint)
  Future<GetDetailsVO>getDetails(
      @Query(kApi) String api,
      @Path(kPathParameterMovieId) int movieId,
      );

  @GET(kGetCreditsEndPoint)
  Future<GetCreditsResponse>getCredits(
      @Query(kApi) String api,
      @Path(kPathParameterMovieId) int movieId,
      );

  @GET(kGetSimilarMoviesEndPoint)
  Future<GetNowPlayingResponse>getSimilarMovies(
      @Path(kPathParameterMovieId) int movieId,
      @Query(kApi) String api,
      @Query(kPage) int page,
      );

  @GET(kGetGenresEndPoint)
  Future<GetGenresResponse>getGenres(
      @Query(kApi) String api
      );

  @GET(kGetMoviesByGenreEndPoint)
  Future<GetMovieByGenresResponse>getMoviesByGenre(
      @Query(kWithGenres) int genre,
      @Query(kApi) String api,
      @Query(kPage) int page,
      );

  @GET(kGetPopularMoviesEndPoint)
  Future<GetPopularMoviesResponse>getPopularMovies(
      @Query(kApi) String api,
      @Query(kPage) int page,
      );

  @GET(kGetActorsEndPoint)
  Future<GetActorsResponse>getActors(
      @Query(kApi) String api,
      @Query(kPage) int page
      );
}
