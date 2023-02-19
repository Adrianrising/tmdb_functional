
import 'package:json_annotation/json_annotation.dart';
import 'package:moviedb_functional/data/vos/get_details_vo/belongs_to_collection.dart';
import 'package:moviedb_functional/data/vos/get_details_vo/production_companies.dart';
import 'package:moviedb_functional/data/vos/get_details_vo/production_countries.dart';
import 'package:moviedb_functional/data/vos/get_details_vo/spoken_languages.dart';

import 'genres.dart';
part 'get_details_vo.g.dart';
@JsonSerializable()
class GetDetailsVO{
  @JsonKey(name: 'adult')
  bool ? adult;

  @JsonKey(name: 'backdrop_path')
  String ? backdropPath;

  @JsonKey(name: 'belongs_to_collection')
  BelongsToCollection ? belongsToCollection;

  @JsonKey(name: 'budget')
  num ? budget;

  @JsonKey(name: 'genres')
  List<Genres> ? genres;

  @JsonKey(name: 'homepage')
  String ? homepage;

  @JsonKey(name: 'id')
  int ? id;

  @JsonKey(name: 'imdb_id')
  String ? imdbId;

  @JsonKey(name: 'original_language')
  String ? originalLanguage;

  @JsonKey(name: 'original_title')
  String ? originalTitle;

  @JsonKey(name: 'overview')
  String ? overview;

  @JsonKey(name: 'popularity')
  num ? popularity;

  @JsonKey(name: 'poster_path')
  String ? posterPath;

  @JsonKey(name: 'production_companies')
  List<ProductionCompanies> ? productionCompanies;

  @JsonKey(name: 'production_countries')
  List<ProductionCountries> ? productionCountries;

  @JsonKey(name: 'release_date')
  String ? releaseDate;

  @JsonKey(name: 'revenue')
  num ? revenue;

  @JsonKey(name: 'runtime')
  num ? runtime;

  @JsonKey(name: 'spoken_languages')
  List<SpokenLanguage> ? spokenLanguages;

  @JsonKey(name: 'status')
  String ? status;

  @JsonKey(name: 'tagline')
  String ? tagline;

  @JsonKey(name: 'title')
  String ? title;

  @JsonKey(name: 'video')
  bool ? video;

  @JsonKey(name: 'vote_average')
  num ? voteAverage;

  @JsonKey(name: 'vote_count')
  int ? voteCount;

  GetDetailsVO(
      this.adult,
      this.backdropPath,
      this.belongsToCollection,
      this.budget,
      this.genres,
      this.homepage,
      this.id,
      this.imdbId,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.productionCompanies,
      this.productionCountries,
      this.releaseDate,
      this.revenue,
      this.runtime,
      this.spokenLanguages,
      this.status,
      this.tagline,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount);

  factory GetDetailsVO.fromJson(Map<String,dynamic>json)=>_$GetDetailsVOFromJson(json);
  Map<String,dynamic>toJson()=>_$GetDetailsVOToJson(this);
}



//     "status": "Released",
//     "tagline": "Forever.",
//     "title": "Black Panther: Wakanda Forever",
//     "video": false,
//     "vote_average": 7.467,
//     "vote_count": 3078
// }