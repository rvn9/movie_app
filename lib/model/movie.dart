import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

enum Genres {
  drama,
  action,
  animation,
  sciFi,
  horror,
}

@freezed
class Movie with _$Movie {
  const factory Movie({
    required String id,
    required String title,
    required String director,
    required String sumary,
    required Genres genres,
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
