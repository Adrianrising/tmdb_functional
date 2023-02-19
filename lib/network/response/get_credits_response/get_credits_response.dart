import 'package:json_annotation/json_annotation.dart';

import '../../../data/vos/get_credits_cast_vo/get_credits_cast_vo.dart';
import '../../../data/vos/get_credits_crew_vo/get_credits_crew_vo.dart';


part 'get_credits_response.g.dart';
@JsonSerializable()
class GetCreditsResponse{
  @JsonKey(name: 'id')
  int ? id;

  @JsonKey(name: 'cast')
  List<GetCreditsCastVO> ? cast;

  @JsonKey(name: 'crew')
  List<GetCreditsCrewVO> ? crew;

  GetCreditsResponse(this.id, this.cast, this.crew);

  factory GetCreditsResponse.fromJson(Map<String,dynamic>json)=>_$GetCreditsResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$GetCreditsResponseToJson(this);
}
