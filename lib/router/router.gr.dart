// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:auto_route/empty_router_widgets.dart' as _i1;
import 'package:flutter/material.dart' as _i5;
import 'package:movie_app/model/movie.dart' as _i6;
import 'package:movie_app/pages/main_page.dart' as _i3;
import 'package:movie_app/pages/movie_detail_page.dart' as _i2;

class AppRouters extends _i4.RootStackRouter {
  AppRouters([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    MainPageRouter.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
        opaque: true,
      );
    },
    MovieDetailPageRoute.name: (routeData) {
      final args = routeData.argsAs<MovieDetailPageRouteArgs>();
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i2.MovieDetailPage(
          key: args.key,
          movie: args.movie,
          addMovie: args.addMovie,
        ),
        opaque: true,
      );
    },
    MainPageRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.MainPage(),
        opaque: true,
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          MainPageRouter.name,
          path: '/main_page',
          children: [
            _i4.RouteConfig(
              MainPageRoute.name,
              path: '',
              parent: MainPageRouter.name,
            ),
            _i4.RouteConfig(
              MovieDetailPageRoute.name,
              path: 'add_movie/:movie',
              parent: MainPageRouter.name,
            ),
          ],
        ),
        _i4.RouteConfig(
          MovieDetailPageRoute.name,
          path: 'add_movie/:movie',
        ),
      ];
}

/// generated route for
/// [_i1.EmptyRouterPage]
class MainPageRouter extends _i4.PageRouteInfo<void> {
  const MainPageRouter({List<_i4.PageRouteInfo>? children})
      : super(
          MainPageRouter.name,
          path: '/main_page',
          initialChildren: children,
        );

  static const String name = 'MainPageRouter';
}

/// generated route for
/// [_i2.MovieDetailPage]
class MovieDetailPageRoute extends _i4.PageRouteInfo<MovieDetailPageRouteArgs> {
  MovieDetailPageRoute({
    _i5.Key? key,
    _i6.Movie? movie,
    required dynamic Function(
      String,
      String,
      String,
      List<_i6.Genres>,
    )
        addMovie,
  }) : super(
          MovieDetailPageRoute.name,
          path: 'add_movie/:movie',
          args: MovieDetailPageRouteArgs(
            key: key,
            movie: movie,
            addMovie: addMovie,
          ),
          rawQueryParams: {'movie': movie},
        );

  static const String name = 'MovieDetailPageRoute';
}

class MovieDetailPageRouteArgs {
  const MovieDetailPageRouteArgs({
    this.key,
    this.movie,
    required this.addMovie,
  });

  final _i5.Key? key;

  final _i6.Movie? movie;

  final dynamic Function(
    String,
    String,
    String,
    List<_i6.Genres>,
  ) addMovie;

  @override
  String toString() {
    return 'MovieDetailPageRouteArgs{key: $key, movie: $movie, addMovie: $addMovie}';
  }
}

/// generated route for
/// [_i3.MainPage]
class MainPageRoute extends _i4.PageRouteInfo<void> {
  const MainPageRoute()
      : super(
          MainPageRoute.name,
          path: '',
        );

  static const String name = 'MainPageRoute';
}
