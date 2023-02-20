import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
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

  @action
  void addMovie(Movie movie) {
    _movieMemory.add(movie);
  }

  @action
  void removeMovie(String id) {
    _movieMemory.delete(id);
  }
}
