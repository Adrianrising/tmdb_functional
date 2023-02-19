//base url
const String kBaseUrl="https://api.themoviedb.org/3";

//end point
const String kGetNowPlayingEndPoint="/movie/now_playing";
const String kGetDetailsEndPoint="/movie/{$kPathParameterMovieId}";
const String kGetCreditsEndPoint="/movie/{$kPathParameterMovieId}/credits";
const String kGetSimilarMoviesEndPoint="/movie/{$kPathParameterMovieId}/similar";
const String kGetGenresEndPoint="/genre/movie/list";
const String kGetMoviesByGenreEndPoint="/discover/movie";
const String kGetPopularMoviesEndPoint="/movie/popular";
const String kGetActorsEndPoint="/person/popular";
//query param
const String kApi="api_key";
const String kPage="page";
const String kWithGenres="with_genres";
//path param
const String kPathParameterMovieId='movie_id';

//api token
const String kApiKey="9087c181498ddef1b5b8e0b191cb19d8";

//image constant
const String kPrefixImageLink="https://image.tmdb.org/t/p/w500";

