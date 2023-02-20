// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_list.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MovieList on _MovieList, Store {
  late final _$isSearchingAtom =
      Atom(name: '_MovieList.isSearching', context: context);

  @override
  bool get isSearching {
    _$isSearchingAtom.reportRead();
    return super.isSearching;
  }

  @override
  set isSearching(bool value) {
    _$isSearchingAtom.reportWrite(value, super.isSearching, () {
      super.isSearching = value;
    });
  }

  late final _$_MovieListActionController =
      ActionController(name: '_MovieList', context: context);

  @override
  void searchMovie(String text) {
    final _$actionInfo = _$_MovieListActionController.startAction(
        name: '_MovieList.searchMovie');
    try {
      return super.searchMovie(text);
    } finally {
      _$_MovieListActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addMovie(
      {required String title,
      required String director,
      required String summary,
      required List<Genres> genres}) {
    final _$actionInfo =
        _$_MovieListActionController.startAction(name: '_MovieList.addMovie');
    try {
      return super.addMovie(
          title: title, director: director, summary: summary, genres: genres);
    } finally {
      _$_MovieListActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeMovie(String id) {
    final _$actionInfo = _$_MovieListActionController.startAction(
        name: '_MovieList.removeMovie');
    try {
      return super.removeMovie(id);
    } finally {
      _$_MovieListActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isSearching: ${isSearching}
    ''';
  }
}
