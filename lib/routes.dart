import 'package:ratingmoviesapp/auth_guard/auth_guard.dart';

import 'all_popular/all_popular.dart';
import 'home/home.dart';
import 'login/login.dart';

var routes = {
  '/': (context) => const AuthGuard(),
  '/login': (context) => const LoginScreen(),
  '/home': (context) => const HomeScreen(),
  '/all_popular': (context) => AllPopularScreen(),
};
