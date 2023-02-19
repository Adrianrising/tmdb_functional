import 'package:json_annotation/json_annotation.dart';

part 'get_credits_cast_vo.g.dart';

@JsonSerializable()
class GetCreditsCastVO{
  @JsonKey(name: 'adult')
  bool ? adult;

  @JsonKey(name: 'gender')
  int ? gender;

  @JsonKey(name: 'id')
  int ? id;

  @JsonKey(name: 'known_for_department')
  String ? knownForDepartment;

  @JsonKey(name: 'name')
  String ? name;

  @JsonKey(name: 'original_name')
  String ? originalName;

  @JsonKey(name: 'popularity')
  num ? popularity;

  @JsonKey(name: 'profile_path')
  String ? profilePath;

  @JsonKey(name: 'cast_id')
  int ? castId;

  @JsonKey(name: 'character')
  String ? character;

  @JsonKey(name: 'credit_id')
  String ? creditId;

  @JsonKey(name: 'order')
  int ? order;

  GetCreditsCastVO(
      this.adult,
      this.gender,
      this.id,
      this.knownForDepartment,
      this.name,
      this.originalName,
      this.popularity,
      this.profilePath,
      this.castId,
      this.character,
      this.creditId,
      this.order);

  factory GetCreditsCastVO.fromJson(Map<String,dynamic>json)=>_$GetCreditsCastVOFromJson(json);
  Map<String,dynamic> toJson()=>_$GetCreditsCastVOToJson(this);
}

//        {
//             "adult": false,
//             "gender": 1,
//             "id": 968367,
//             "known_for_department": "Acting",
//             "name": "Stephanie Beatriz",
//             "original_name": "Stephanie Beatriz",
//             "popularity": 26.191,
//             "profile_path": "/pGo7zMGsMXOMSMZc68Xi3LvzeP0.jpg",
//             "cast_id": 8,
//             "character": "Mirabel Madrigal (voice)",
//             "credit_id": "5fee8b5e176a94003fe4998a",
//             "order": 0
//         },