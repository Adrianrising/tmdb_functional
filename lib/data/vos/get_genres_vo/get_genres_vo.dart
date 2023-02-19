import 'package:json_annotation/json_annotation.dart';

part 'get_genres_vo.g.dart';

@JsonSerializable()
class GetGenresVO{
  @JsonKey(name: 'id')
  int ? id;

  @JsonKey(name: 'name')
  String ? name;

  GetGenresVO(this.id, this.name);
  factory GetGenresVO.fromJson(Map<String,dynamic>json)=>_$GetGenresVOFromJson(json);
  Map<String,dynamic> toJson()=>_$GetGenresVOToJson(this);
}