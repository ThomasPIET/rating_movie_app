import 'package:flutter/material.dart';
import 'package:ratingmoviesapp/services/auth.dart';

import '../home/home.dart';
import '../login/login.dart';



class  AuthGuard extends StatelessWidget {
  const AuthGuard({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: AuthServices().userStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('An error occurred'),
            );
          } else if (snapshot.hasData) {
            return  const HomeScreen();
          }
          return const LoginScreen();
        });
  }
}