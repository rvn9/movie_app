// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_list.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MovieList on _MovieList, Store {
  late final _$_MovieListActionController =
      ActionController(name: '_MovieList', context: context);

  @override
  void addMovie(Movie movie) {
    final _$actionInfo =
        _$_MovieListActionController.startAction(name: '_MovieList.addMovie');
    try {
      return super.addMovie(movie);
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

    ''';
  }
}
