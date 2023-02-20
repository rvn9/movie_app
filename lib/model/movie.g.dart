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
      genres: (json['genres'] as List<dynamic>)
          .map((e) => $enumDecode(_$GenresEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$$_MovieToJson(_$_Movie instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'director': instance.director,
      'sumary': instance.sumary,
      'genres': instance.genres.map((e) => _$GenresEnumMap[e]!).toList(),
    };

const _$GenresEnumMap = {
  Genres.drama: 'drama',
  Genres.action: 'action',
  Genres.animation: 'animation',
  Genres.sciFi: 'sciFi',
  Genres.horror: 'horror',
};
