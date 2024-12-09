import 'package:flutter/material.dart';
import 'package:ratingmoviesapp/shared/bottom_nav.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community'),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 1),
    );
  }
}
