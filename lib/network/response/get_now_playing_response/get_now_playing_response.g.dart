// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_now_playing_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetNowPlayingResponse _$GetNowPlayingResponseFromJson(
        Map<String, dynamic> json) =>
    GetNowPlayingResponse(
      json['dates'] == null
          ? null
          : Dates.fromJson(json['dates'] as Map<String, dynamic>),
      json['page'] as int?,
      (json['results'] as List<dynamic>?)
          ?.map((e) => GetNowPlayingVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['total_pages'] as int?,
      json['total_results'] as int?,
    );

Map<String, dynamic> _$GetNowPlayingResponseToJson(
        GetNowPlayingResponse instance) =>
    <String, dynamic>{
      'dates': instance.dates,
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
