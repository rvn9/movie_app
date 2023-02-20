import 'package:auto_route/auto_route.dart';
import 'package:movie_app/pages/add_movie_page.dart';
import 'package:movie_app/pages/main_page.dart';

@AdaptiveAutoRouter(routes: <AutoRoute>[
  MainPage.route,
  AddMoviePage.route,
])
class $AppRouters {}
