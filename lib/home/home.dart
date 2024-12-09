import 'package:flutter/material.dart';
import 'package:ratingmoviesapp/shared/bottom_nav.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 0),
    );
  }
}
