import 'package:json_annotation/json_annotation.dart';

import '../../../data/vos/get_now_playing_vo/get_now_playing_vo.dart';
part 'get_popular_movies_response.g.dart';
@JsonSerializable()
class GetPopularMoviesResponse{
  @JsonKey(name: 'page')
  int ? page;

  @JsonKey(name: 'results')
  List<GetNowPlayingVO>? results;

  @JsonKey(name: 'total_pages')
  int ? totalPages;

  @JsonKey(name: 'total_results')
  int ? totalResults;

  GetPopularMoviesResponse(
      this.page, this.results, this.totalPages, this.totalResults);

  factory GetPopularMoviesResponse.fromJson(Map<String,dynamic>json)=>_$GetPopularMoviesResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$GetPopularMoviesResponseToJson(this);
}