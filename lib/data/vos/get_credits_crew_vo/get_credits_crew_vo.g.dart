// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_credits_crew_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCreditsCrewVO _$GetCreditsCrewVOFromJson(Map<String, dynamic> json) =>
    GetCreditsCrewVO(
      json['adult'] as bool?,
      json['gender'] as int?,
      json['id'] as int?,
      json['known_for_department'] as String?,
      json['name'] as String?,
      json['original_name'] as String?,
      json['popularity'] as num?,
      json['profile_path'] as String?,
      json['credit_id'] as String?,
      json['department'] as String?,
      json['job'] as String?,
    );

Map<String, dynamic> _$GetCreditsCrewVOToJson(GetCreditsCrewVO instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'gender': instance.gender,
      'id': instance.id,
      'known_for_department': instance.knownForDepartment,
      'name': instance.name,
      'original_name': instance.originalName,
      'popularity': instance.popularity,
      'profile_path': instance.profilePath,
      'credit_id': instance.creditId,
      'department': instance.department,
      'job': instance.job,
    };
