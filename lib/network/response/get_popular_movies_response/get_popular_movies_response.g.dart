// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_popular_movies_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPopularMoviesResponse _$GetPopularMoviesResponseFromJson(
        Map<String, dynamic> json) =>
    GetPopularMoviesResponse(
      json['page'] as int?,
      (json['results'] as List<dynamic>?)
          ?.map((e) => GetNowPlayingVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['total_pages'] as int?,
      json['total_results'] as int?,
    );

Map<String, dynamic> _$GetPopularMoviesResponseToJson(
        GetPopularMoviesResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
