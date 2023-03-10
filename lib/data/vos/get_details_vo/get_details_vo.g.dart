// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_details_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDetailsVO _$GetDetailsVOFromJson(Map<String, dynamic> json) => GetDetailsVO(
      json['adult'] as bool?,
      json['backdrop_path'] as String?,
      json['belongs_to_collection'] == null
          ? null
          : BelongsToCollection.fromJson(
              json['belongs_to_collection'] as Map<String, dynamic>),
      json['budget'] as num?,
      (json['genres'] as List<dynamic>?)
          ?.map((e) => Genres.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['homepage'] as String?,
      json['id'] as int?,
      json['imdb_id'] as String?,
      json['original_language'] as String?,
      json['original_title'] as String?,
      json['overview'] as String?,
      json['popularity'] as num?,
      json['poster_path'] as String?,
      (json['production_companies'] as List<dynamic>?)
          ?.map((e) => ProductionCompanies.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['production_countries'] as List<dynamic>?)
          ?.map((e) => ProductionCountries.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['release_date'] as String?,
      json['revenue'] as num?,
      json['runtime'] as num?,
      (json['spoken_languages'] as List<dynamic>?)
          ?.map((e) => SpokenLanguage.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['status'] as String?,
      json['tagline'] as String?,
      json['title'] as String?,
      json['video'] as bool?,
      json['vote_average'] as num?,
      json['vote_count'] as int?,
    );

Map<String, dynamic> _$GetDetailsVOToJson(GetDetailsVO instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'belongs_to_collection': instance.belongsToCollection,
      'budget': instance.budget,
      'genres': instance.genres,
      'homepage': instance.homepage,
      'id': instance.id,
      'imdb_id': instance.imdbId,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'production_companies': instance.productionCompanies,
      'production_countries': instance.productionCountries,
      'release_date': instance.releaseDate,
      'revenue': instance.revenue,
      'runtime': instance.runtime,
      'spoken_languages': instance.spokenLanguages,
      'status': instance.status,
      'tagline': instance.tagline,
      'title': instance.title,
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };
