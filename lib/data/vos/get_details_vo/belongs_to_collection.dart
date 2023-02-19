import 'package:json_annotation/json_annotation.dart';
part 'belongs_to_collection.g.dart';
@JsonSerializable()
class BelongsToCollection{
  @JsonKey(name: 'id')
  int ? id;
  @JsonKey(name: 'name')
  String ? name;
  @JsonKey(name: 'poster_path')
  String ? posterPath;
  @JsonKey(name: 'backdrop_path')
  String ? backdropPath;

  BelongsToCollection(this.id, this.name, this.posterPath, this.backdropPath);
  factory BelongsToCollection.fromJson(Map<String,dynamic>json)=>_$BelongsToCollectionFromJson(json);
  Map<String,dynamic>toJson()=>_$BelongsToCollectionToJson(this);
}

//     "belongs_to_collection": {
//         "id": 529892,
//         "name": "Black Panther Collection",
//         "poster_path": "/9ZSPIsxI3TZDgfg0Jzk0RZl4INg.jpg",
//         "backdrop_path": "/yzVxUMYGKjK3GgmVI2BhmbuL9UY.jpg"
//     },