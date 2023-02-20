import 'package:auto_route/auto_route.dart';
import 'package:movie_app/pages/movie_detail_page.dart';
import 'package:movie_app/pages/main_page.dart';

@AdaptiveAutoRouter(routes: <AutoRoute>[
  MainPage.route,
  MovieDetailPage.route,
])
class $AppRouters {}
