// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Movie _$$_MovieFromJson(Map<String, dynamic> json) => _$_Movie(
      id: json['id'] as String,
      title: json['title'] as String,
      director: json['director'] as String,
      sumary: json['sumary'] as String,
      genres: $enumDecode(_$GenresEnumMap, json['genres']),
    );

Map<String, dynamic> _$$_MovieToJson(_$_Movie instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'director': instance.director,
      'sumary': instance.sumary,
      'genres': _$GenresEnumMap[instance.genres]!,
    };

const _$GenresEnumMap = {
  Genres.drama: 'drama',
  Genres.action: 'action',
  Genres.animation: 'animation',
  Genres.sciFi: 'sciFi',
  Genres.horror: 'horror',
};
