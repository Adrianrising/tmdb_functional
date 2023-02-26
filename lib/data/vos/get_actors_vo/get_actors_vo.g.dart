// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_actors_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GetActorsVOAdapter extends TypeAdapter<GetActorsVO> {
  @override
  final int typeId = 2;

  @override
  GetActorsVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GetActorsVO(
      fields[0] as bool?,
      fields[1] as int?,
      fields[2] as int?,
      (fields[3] as List?)?.cast<GetNowPlayingVO>(),
      fields[4] as String?,
      fields[5] as String?,
      fields[6] as num?,
      fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, GetActorsVO obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.adult)
      ..writeByte(1)
      ..write(obj.gender)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.knownFor)
      ..writeByte(4)
      ..write(obj.knownForDepartment)
      ..writeByte(5)
      ..write(obj.name)
      ..writeByte(6)
      ..write(obj.popularity)
      ..writeByte(7)
      ..write(obj.profilePath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetActorsVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetActorsVO _$GetActorsVOFromJson(Map<String, dynamic> json) => GetActorsVO(
      json['adult'] as bool?,
      json['gender'] as int?,
      json['id'] as int?,
      (json['known_for'] as List<dynamic>?)
          ?.map((e) => GetNowPlayingVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['known_for_department'] as String?,
      json['name'] as String?,
      json['popularity'] as num?,
      json['profile_path'] as String?,
    );

Map<String, dynamic> _$GetActorsVOToJson(GetActorsVO instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'gender': instance.gender,
      'id': instance.id,
      'known_for': instance.knownFor,
      'known_for_department': instance.knownForDepartment,
      'name': instance.name,
      'popularity': instance.popularity,
      'profile_path': instance.profilePath,
    };
