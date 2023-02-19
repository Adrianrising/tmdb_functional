import 'package:json_annotation/json_annotation.dart';

import '../../../data/vos/get_actors_vo/get_actors_vo.dart';
part 'get_actors_response.g.dart';
@JsonSerializable()
class GetActorsResponse{
  @JsonKey(name: 'page')
  int ? page;
  @JsonKey(name: 'results')
  List<GetActorsVO>? results;
  @JsonKey(name: 'total_pages')
  int ? totalPages;
  @JsonKey(name: 'total_results')
  int ? totalResults;

  GetActorsResponse(
      this.page, this.results, this.totalPages, this.totalResults);
  factory GetActorsResponse.fromJson(Map<String,dynamic>json)=>_$GetActorsResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$GetActorsResponseToJson(this);
}