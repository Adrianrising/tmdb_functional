import 'package:json_annotation/json_annotation.dart';

import 'known_for.dart';
part 'get_actors_vo.g.dart';
@JsonSerializable()
class GetActorsVO{
  @JsonKey(name: 'adult')
  bool ? adult;
  @JsonKey(name: 'gender')
  int ? gender;
  @JsonKey(name: 'id')
  int ? id;
  @JsonKey(name: 'known_for')
  List<KnownFor> ? knownFor;
  @JsonKey(name: 'known_for_department')
  String ? knownForDepartment;
  @JsonKey(name: 'name')
  String ? name;
  @JsonKey(name: 'popularity')
  num ? popularity;
  @JsonKey(name: 'profile_path')
  String ? profilePath;

  GetActorsVO(this.adult, this.gender, this.id, this.knownFor,
      this.knownForDepartment, this.name, this.popularity, this.profilePath);

  factory GetActorsVO.fromJson(Map<String,dynamic>json)=>_$GetActorsVOFromJson(json);
  Map<String,dynamic>toJson()=>_$GetActorsVOToJson(this);
}


//  {
//             "adult": false,
//             "gender": 1,
//             "id": 3194176,
// "known_for_department": "Acting",
// "name": "Angeli Khang",
// "popularity": 207.845,
// "profile_path": "/7vrTWF8PxQogF6o9ORZprYQoDOr.jpg"
// },