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
import 'package:movie_app/pages/add_movie_page.dart' as _i2;
import 'package:movie_app/pages/main_page.dart' as _i3;

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
    AddMoviePageRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.AddMoviePage(),
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
              AddMoviePageRoute.name,
              path: 'add_movie',
              parent: MainPageRouter.name,
            ),
          ],
        ),
        _i4.RouteConfig(
          AddMoviePageRoute.name,
          path: 'add_movie',
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
/// [_i2.AddMoviePage]
class AddMoviePageRoute extends _i4.PageRouteInfo<void> {
  const AddMoviePageRoute()
      : super(
          AddMoviePageRoute.name,
          path: 'add_movie',
        );

  static const String name = 'AddMoviePageRoute';
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
