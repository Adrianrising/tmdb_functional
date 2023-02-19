import 'package:json_annotation/json_annotation.dart';
part 'known_for.g.dart';
@JsonSerializable()
class KnownFor{
  @JsonKey(name: 'adult')
  bool ? adult;
  @JsonKey(name: 'backdrop_path')
  String ? backdropPath;
  @JsonKey(name: 'genre_ids')
  List<int>? genreIds;
  @JsonKey(name: 'id')
  int ? id;
  @JsonKey(name: 'media_type')
  String ? mediaType;
  @JsonKey(name: 'original_language')
  String ? originalLanguage;
  @JsonKey(name: 'original_title')
  String ? originalTitle;
  @JsonKey(name: 'overview')
  String ? overview;
  @JsonKey(name: 'poster_path')
  String ? posterPath;
  @JsonKey(name: 'release_date')
  String ? releaseDate;
  @JsonKey(name: 'title')
  String ? title;
  @JsonKey(name: 'video')
  bool ? video;
  @JsonKey(name: 'vote_average')
  num ? voteAverage;
  @JsonKey(name: 'vote_count')
  int ? voteCount;

  KnownFor(
      this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.mediaType,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount);

  factory KnownFor.fromJson(Map<String,dynamic>json)=>_$KnownForFromJson(json);
  Map<String,dynamic>toJson()=>_$KnownForToJson(this);
}

// {
//                     "adult": false,
//                     "backdrop_path": "/27bkw4o1zhjQAM4WIFQPohiph1X.jpg",
//                     "genre_ids": [
//                         18
//                     ],
//                     "id": 931599,
//                     "media_type": "movie",
//                     "original_language": "tl",
//                     "original_title": "Silip Sa Apoy",
//                     "overview": "Take a peek at the life of an unhappy housewife who finds passionate love from her neighbor and how their affair brings them closer to fire.",
//                     "poster_path": "/9grG4PVppBWqKs2hrKMEr6j3RWS.jpg",
//                     "release_date": "2022-01-28",
//                     "title": "Silip Sa Apoy",
//                     "video": false,
//                     "vote_average": 6.3,
//                     "vote_count": 23
//                 },