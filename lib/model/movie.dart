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
    required List<Genres> genres,
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}

String getGenres(Genres genres) {
  if (genres == Genres.action) {
    return 'Action';
  } else if (genres == Genres.drama) {
    return 'Drama';
  } else if (genres == Genres.horror) {
    return 'Horror';
  } else if (genres == Genres.sciFi) {
    return 'Sci-Fi';
  } else if (genres == Genres.animation) {
    return 'Animation';
  }
  return '';
}
