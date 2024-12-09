import 'package:ratingmoviesapp/auth_guard/auth_guard.dart';

import 'home/home.dart';
import 'login/login.dart';

var routes = {
  '/': (context) => const AuthGuard(),
  '/login': (context) => const LoginScreen(),
  '/home': (context) =>  HomeScreen(),
};
