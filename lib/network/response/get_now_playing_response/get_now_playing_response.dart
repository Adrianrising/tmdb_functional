
import 'package:json_annotation/json_annotation.dart';

import '../../../data/vos/get_now_playing_vo/get_now_playing_vo.dart';
import 'dates.dart';

part 'get_now_playing_response.g.dart';
@JsonSerializable()
class GetNowPlayingResponse{
  @JsonKey(name: 'dates')
  Dates ? dates;
  @JsonKey(name: 'page')
  int ? page;
  @JsonKey(name: 'results')
  List<GetNowPlayingVO> ? results;
  @JsonKey(name: 'total_pages')
  int ? totalPages;
  @JsonKey(name: 'total_results')
  int ? totalResults;

  GetNowPlayingResponse(
      this.dates, this.page, this.results, this.totalPages, this.totalResults);
  factory GetNowPlayingResponse.fromJson(Map<String,dynamic>json)=>_$GetNowPlayingResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$GetNowPlayingResponseToJson(this);
}