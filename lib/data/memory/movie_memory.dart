import 'package:mobx/mobx.dart';
import 'package:movie_app/model/movie.dart';
import 'package:uuid/uuid.dart';

class MovieMemory {
  final _movies = ObservableList<Movie>.of([
    Movie(
        id: Uuid().v4(),
        title: "ini film apaya",
        director: 'jono',
        sumary: 'bagus dah',
        genres: Genres.action),
    Movie(
        id: Uuid().v4(),
        title: "ini film",
        director: 'joko',
        sumary: 'bagus dah',
        genres: Genres.action),
    Movie(
        id: Uuid().v4(),
        title: "bukan film",
        director: 'juju',
        sumary: 'bagus dah',
        genres: Genres.action),
  ]);

  static MovieMemory create() => MovieMemory();

  ObservableList<Movie> get movies => _movies;

  void add(Movie movie) {
    _movies.add(movie);
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

  List<Movie> search(String title) {
    return _movies.where((element) => element.title == title).toList();
  }
}
