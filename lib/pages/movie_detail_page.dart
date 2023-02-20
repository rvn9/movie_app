import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../model/movie.dart';
import '../widget/chip_widget.dart';

class MovieDetailPage extends StatefulWidget {
  final Movie? movie;
  final Function(
    String title,
    String director,
    String summary,
    List<Genres> genres,
  ) addMovie;

  const MovieDetailPage({
    super.key,
    @QueryParam('movie') this.movie,
    required this.addMovie,
  });

  static const route = AdaptiveRoute(
    page: MovieDetailPage,
    path: 'add_movie/:movie',
  );

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  late final TextEditingController _titleController;
  late final TextEditingController _directorController;
  late final TextEditingController _summaryController;
  late final ValueNotifier<List<Genres>> _genreController;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    final movie = widget.movie;

    _titleController = TextEditingController();
    _directorController = TextEditingController();
    _summaryController = TextEditingController();
    _genreController = ValueNotifier([]);

    if (movie != null) {
      _titleController.text = movie.title;
      _directorController.text = movie.director;
      _summaryController.text = movie.sumary;
      _genreController.value = movie.genres;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _directorController.dispose();
    _summaryController.dispose();
    _genreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie title'),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              if (_formKey.currentState?.validate() ?? false) {
                // add new movie.
                widget.addMovie.call(
                  _titleController.text,
                  _directorController.text,
                  _summaryController.text,
                  _genreController.value,
                );
              }
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 16),
              child: Icon(
                Icons.save_outlined,
                color: Colors.white,
                size: 24.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
        child: Form(
          key: _formKey,
          child: ScrollConfiguration(
            behavior:
                const MaterialScrollBehavior().copyWith(overscroll: false),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      labelText: 'Title',
                      // Set border for enabled state (default)
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 3, color: Colors.blue),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      // Set border for focused state
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 3, color: Colors.red),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: _directorController,
                    decoration: InputDecoration(
                      labelText: 'Director',
                      // Set border for enabled state (default)
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 3, color: Colors.blue),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      // Set border for focused state
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 3, color: Colors.red),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: _summaryController,
                    maxLength: 100,
                    maxLines: 3,
                    decoration: InputDecoration(
                      labelText: 'Summary',

                      // Set border for enabled state (default)
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 3, color: Colors.blue),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      // Set border for focused state
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 3, color: Colors.red),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Genres',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ValueListenableBuilder<List<Genres>>(
                    valueListenable: _genreController,
                    builder: (context, value, child) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              GenreChip(
                                genreController: _genreController,
                                genresType: Genres.drama,
                              ),
                              GenreChip(
                                genreController: _genreController,
                                genresType: Genres.sciFi,
                              ),
                              GenreChip(
                                genreController: _genreController,
                                genresType: Genres.horror,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              GenreChip(
                                genreController: _genreController,
                                genresType: Genres.animation,
                              ),
                              GenreChip(
                                genreController: _genreController,
                                genresType: Genres.action,
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GenreChip extends StatelessWidget {
  final ValueNotifier<List<Genres>> genreController;
  final Genres genresType;
  const GenreChip(
      {super.key, required this.genreController, required this.genresType});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (genreController.value.contains(genresType)) {
          genreController.value = List.from(genreController.value)
            ..remove(genresType);
        } else {
          genreController.value = List.from(genreController.value)
            ..add(genresType);
        }
      },
      child: IconChipWidget(
        label: getGenres(genresType),
        backgroundColor: genreController.value.contains(genresType)
            ? const Color(0xff4e73f8)
            : const Color(0x144e73f8),
        labelColor: genreController.value.contains(genresType)
            ? Colors.white
            : const Color(0xff4e73f8),
      ),
    );
  }
}
