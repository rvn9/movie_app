import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:movie_app/data/memory/movie_memory.dart';

final getIt = GetIt.instance;

class Injector {
  const Injector();

  static Future<void> initialize() async {
    const injector = Injector();
    injector._initializeStorage();
  }

  void _initializeStorage() {
    getIt.registerFactory<MovieMemory>(() => MovieMemory());
  }
}
