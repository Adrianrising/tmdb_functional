import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:moviedb_functional/data/vos/get_now_playing_vo/get_now_playing_vo.dart';

import '../../../constant/hive_constant.dart';
import 'known_for.dart';
part 'get_actors_vo.g.dart';
@JsonSerializable()
@HiveType(typeId: kActorsHiveType)
class GetActorsVO{

  @JsonKey(name: 'adult')
  @HiveField(0)
  bool ? adult;
  @JsonKey(name: 'gender')
  @HiveField(1)
  int ? gender;
  @JsonKey(name: 'id')
  @HiveField(2)
  int ? id;

  @JsonKey(name: 'known_for')
  @HiveField(3)
  List<GetNowPlayingVO> ? knownFor;

  @JsonKey(name: 'known_for_department')
  @HiveField(4)
  String ? knownForDepartment;
  @JsonKey(name: 'name')
  @HiveField(5)
  String ? name;
  @JsonKey(name: 'popularity')
  @HiveField(6)
  num ? popularity;
  @JsonKey(name: 'profile_path')
  @HiveField(7)
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