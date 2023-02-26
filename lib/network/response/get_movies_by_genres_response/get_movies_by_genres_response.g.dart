// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_movies_by_genres_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMovieByGenresResponse _$GetMovieByGenresResponseFromJson(
        Map<String, dynamic> json) =>
    GetMovieByGenresResponse(
      json['page'] as int?,
      (json['results'] as List<dynamic>?)
          ?.map((e) => GetNowPlayingVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['total_pages'] as int?,
      json['total_results'] as int?,
    );

Map<String, dynamic> _$GetMovieByGenresResponseToJson(
        GetMovieByGenresResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
