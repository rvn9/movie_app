import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';

import '../../model/movie.dart';

class MovieMemory {
  final _movies = ObservableList<Movie>.of([
    Movie(
      id: const Uuid().v4(),
      title: 'Titanic',
      director: 'James Titanic',
      sumary:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam enim lectus, pharetra vulputate dapibus',
      genres: [Genres.drama, Genres.action, Genres.animation],
    ),
    Movie(
      id: const Uuid().v4(),
      title: 'Avengers',
      director: 'Avenge Sevenfold',
      sumary:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam enim lectus, pharetra vulputate dapibus',
      genres: [Genres.action],
    ),
    Movie(
      id: const Uuid().v4(),
      title: 'Scary Movie ',
      director: 'James Scary',
      sumary:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam enim lectus, pharetra vulputate dapibus',
      genres: [Genres.horror],
    )
  ]);

  final _searchMovies = ObservableList<Movie>.of([]);

  static MovieMemory create() => MovieMemory();

  ObservableList<Movie> get movies => _movies;

  ObservableList<Movie> get searchMovies => _searchMovies;

  void add(Movie movie) {
    _movies.insert(0, movie);
  }

  void update(String id, Movie movie) {
    final index = _movies.indexWhere((e) => e.id == id);
    _movies[index] = _movies[index].copyWith(
      title: movie.title,
      director: movie.director,
      sumary: movie.sumary,
    );
  }

  void delete(String id) {
    _movies.removeWhere((e) => e.id == id);
  }

  void clearAll() {
    _movies.clear();
  }

  void search(String title) {
    _searchMovies.clear();
    _searchMovies.addAll(_movies
        .where((element) => element.title.toLowerCase().contains(title)));
  }
}
