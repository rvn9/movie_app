import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';

import 'package:movie_app/data/memory/movie_memory.dart';

import '../injector.dart';
import '../model/movie.dart';

part 'movie_list.g.dart';

class MovieList extends _MovieList with _$MovieList {
  MovieList(super.movieMemory);
  static MovieList create(BuildContext context) => MovieList(getIt.get());
}

abstract class _MovieList with Store {
  final MovieMemory _movieMemory;

  _MovieList(this._movieMemory);

  ObservableList<Movie> get movies => _movieMemory.movies;

  ObservableList<Movie> get searchMovies => _movieMemory.searchMovies;

  @observable
  bool isSearching = false;

  @action
  void searchMovie(String text) {
    _movieMemory.search(text);
    if (text != '') {
      isSearching = true;
    } else {
      isSearching = false;
    }
  }

  @action
  void addMovie({
    required String title,
    required String director,
    required String summary,
    required List<Genres> genres,
  }) {
    final id = const Uuid().v4();
    final movie = Movie(
      id: id,
      title: title,
      director: director,
      sumary: summary,
      genres: genres,
    );
    _movieMemory.add(movie);
  }

  void updateMovie({
    required int index,
    required String title,
    required String director,
    required String summary,
    required List<Genres> genres,
  }) {
    _movieMemory.movies[index] = _movieMemory.movies[index].copyWith(
      title: title,
      director: director,
      sumary: summary,
      genres: genres,
    );
  }

  @action
  void removeMovie(String id) {
    _movieMemory.delete(id);
  }
}
