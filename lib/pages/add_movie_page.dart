import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class AddMoviePage extends StatefulWidget {
  const AddMoviePage({super.key});

  static const route = AdaptiveRoute(
    page: AddMoviePage,
    path: 'add_movie',
  );

  @override
  State<AddMoviePage> createState() => _AddMoviePageState();
}

class _AddMoviePageState extends State<AddMoviePage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
