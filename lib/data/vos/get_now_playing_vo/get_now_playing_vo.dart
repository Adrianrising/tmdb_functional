import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../constant/hive_constant.dart';

part 'get_now_playing_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kGetNowPlayingHiveType)
class GetNowPlayingVO {
  @JsonKey(name: 'adult')
  @HiveField(0)
  bool? adult;

  @JsonKey(name: 'backdrop_path')
  @HiveField(1)
  String? backdropPath;

  @JsonKey(name: 'genre_ids')
  @HiveField(2)
  List<int>? genreIds;

  @JsonKey(name: 'id')
  @HiveField(3)
  int? id;

  @JsonKey(name: 'original_language')
  @HiveField(4)
  String? originalLanguage;

  @JsonKey(name: 'original_title')
  @HiveField(5)
  String? originalTitle;

  @JsonKey(name: 'overview')
  @HiveField(6)
  String? overview;

  @JsonKey(name: 'popularity')
  @HiveField(7)
  num? popularity;

  @JsonKey(name: 'poster_path')
  @HiveField(8)
  String? posterPath;

  @JsonKey(name: 'release_date')
  @HiveField(9)
  String? releaseDate;

  @JsonKey(name: 'title')
  @HiveField(10)
  String? title;

  @JsonKey(name: 'video')
  @HiveField(11)
  bool? video;

  @JsonKey(name: 'vote_average')
  @HiveField(12)
  num? voteAverage;

  @JsonKey(name: 'vote_count')
  @HiveField(13)
  int? voteCount;

  @HiveField(14)
  bool? getNowPlaying;
  @HiveField(15)
  bool? getSimilarMovies;
  @HiveField(16)
  bool? getPopularMovies;
  @HiveField(17)
  bool? getMoviesByGenre;

  GetNowPlayingVO(
      this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount,
      {this.getNowPlaying = false,
      this.getSimilarMovies = false,
      this.getPopularMovies = false,
      this.getMoviesByGenre=false});

  factory GetNowPlayingVO.fromJson(Map<String, dynamic> json) =>
      _$GetNowPlayingVOFromJson(json);

  Map<String, dynamic> toJson() => _$GetNowPlayingVOToJson(this);
}
