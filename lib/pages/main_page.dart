import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../mobx/movie_list.dart';
import '../router/router.gr.dart';
import '../widget/card_widget.dart';
import 'movie_detail_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  static const route = AdaptiveRoute(
    page: EmptyRouterPage,
    path: '/main_page',
    name: 'MainPageRouter',
    children: [
      AdaptiveRoute(
        page: MainPage,
        path: '',
      ),
      MovieDetailPage.route,
    ],
  );

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final TextEditingController _searchController;
  late final MovieList _movieList;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _movieList = MovieList.create(context);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Collection'),
      ),
      body: Provider.value(
        value: _movieList,
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              floating: false,
              delegate: SearchField(_searchController),
            ),
            Observer(
                warnWhenNoObservables: true,
                builder: (context) {
                  final movies = _movieList.isSearching
                      ? _movieList.searchMovies
                      : _movieList.movies;
                  return SliverFillRemaining(
                    child: ScrollConfiguration(
                      behavior: const MaterialScrollBehavior()
                          .copyWith(overscroll: false),
                      child: ListView.builder(
                        itemCount: movies.length,
                        itemBuilder: (context, index) {
                          final movie = movies[index];
                          return GestureDetector(
                            onTap: () {
                              AutoRouter.of(context).push(MovieDetailPageRoute(
                                movie: movie,
                                addMovie:
                                    (title, director, summary, genres) async {
                                  context.read<MovieList>().updateMovie(
                                        index: index,
                                        title: title,
                                        director: director,
                                        summary: summary,
                                        genres: genres,
                                      );
                                  await Fluttertoast.showToast(
                                    msg: 'Success updating movie',
                                    toastLength: Toast.LENGTH_LONG,
                                  );
                                  if (mounted) AutoRouter.of(context).pop();
                                },
                              ));
                              FocusScope.of(context).unfocus();
                            },
                            child: Dismissible(
                              key: Key(movie.id),
                              direction: DismissDirection.endToStart,
                              background: Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: Card(
                                    margin: EdgeInsets.zero,
                                    elevation: 2.0,
                                    color: Colors.red,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      side: const BorderSide(
                                          color: Color(0xffe1e3e6), width: 1.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Icon(
                                            Icons.delete,
                                            color: Colors.white,
                                            size: 48,
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                              onDismissed: (direction) {
                                if (direction == DismissDirection.endToStart) {
                                  context
                                      .read<MovieList>()
                                      .removeMovie(movie.id);
                                }
                              },
                              confirmDismiss: (direction) async {
                                if (direction == DismissDirection.endToStart) {
                                  return await showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text("Confirm"),
                                        content: const Text(
                                            "Are you sure you wish to delete this movie?"),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () =>
                                                AutoRouter.of(context)
                                                    .pop(true),
                                            child: const Text("DELETE"),
                                          ),
                                          TextButton(
                                            onPressed: () =>
                                                AutoRouter.of(context)
                                                    .pop(false),
                                            child: const Text("CANCEL"),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: CardWidget(
                                  title: movie.title,
                                  director: movie.director,
                                  summary: movie.sumary,
                                  genres: movie.genres,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AutoRouter.of(context).push(
            MovieDetailPageRoute(
              addMovie: (title, director, summary, genres) async {
                _movieList.addMovie(
                  title: title,
                  director: director,
                  summary: summary,
                  genres: genres,
                );
                await Fluttertoast.showToast(
                  msg: 'Success adding new movie',
                  toastLength: Toast.LENGTH_LONG,
                );
                if (mounted) AutoRouter.of(context).pop();
              },
            ),
          );
          FocusScope.of(context).unfocus();
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}

class SearchField extends SliverPersistentHeaderDelegate {
  final TextEditingController _searchController;

  SearchField(this._searchController);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: TextField(
          maxLines: 1,
          controller: _searchController,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search_outlined),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            hintText: 'Find movie by title',
          ),
          onChanged: (value) {
            context.read<MovieList>().searchMovie(value);
          },
        ),
      ),
    );
  }

  @override
  double get maxExtent => 100;

  @override
  double get minExtent => 80;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
