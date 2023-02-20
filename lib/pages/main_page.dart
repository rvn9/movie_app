import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movie_app/mobx/movie_list.dart';
import 'package:movie_app/pages/add_movie_page.dart';
import 'package:movie_app/widget/card_widget.dart';

import '../injector.dart';

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
      AddMoviePage.route,
    ],
  );

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final movieList = MovieList.create(context);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 246, 238, 1),
      appBar: AppBar(
        title: const Text('Movie Collection'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            floating: false,
            delegate: Delegate(Colors.red, "test", _searchController),
          ),
          Observer(builder: (context) {
            debugPrint('list movie : ' + movieList.movies.toString());
            return SliverFillRemaining(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: CardWidget(
                    titleText: 'test',
                    subtitleText: 'test2',
                  ),
                ),
              ),
            );
          })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.navigation),
      ),
    );
  }
}

class Delegate extends SliverPersistentHeaderDelegate {
  final Color backgroundColor;
  final String headerTitle;
  final TextEditingController _searchController;

  Delegate(this.backgroundColor, this.headerTitle, this._searchController);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: const Color.fromRGBO(249, 246, 238, 1),
      child: Center(
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
          ),
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
