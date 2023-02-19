import 'package:json_annotation/json_annotation.dart';

import '../../../data/vos/get_movies_by_genres_vo/get_movies_by_genres_vo.dart';

part 'get_movies_by_genres_response.g.dart';
@JsonSerializable()
class GetMovieByGenresResponse{
  @JsonKey(name: 'page')
  int ? page;

  @JsonKey(name: 'results')
  List<GetMoviesByGenresVO> ? results;

  @JsonKey(name: 'total_pages')
  int ? totalPages;

  @JsonKey(name: 'total_results')
  int ? totalResults;

  GetMovieByGenresResponse(
      this.page, this.results, this.totalPages, this.totalResults);
  factory GetMovieByGenresResponse.fromJson(Map<String,dynamic>json)=>_$GetMovieByGenresResponseFromJson(json);
  Map<String,dynamic> toJson()=>_$GetMovieByGenresResponseToJson(this);
}

//flutter pub run build_runner build --delete-conflicting-outputs