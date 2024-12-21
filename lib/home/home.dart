import 'package:flutter/material.dart';
import 'package:ratingmoviesapp/home/popular_container.dart';
import '../shared/bottom_nav.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            height: 110,
            child: Padding(
              padding: const EdgeInsets.only(top: 50, left: 10),
              child: Row(
                children: [
                  SizedBox.fromSize(
                    size: const Size(56, 56),
                    child: ClipOval(
                      child: Image.asset('assets/logo.png'),
                    ),
                  ),
                  const SizedBox(width: 10), // Spacing between logo and text
                  const Text(
                    'RateFlix',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Body
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Discover. Rate. Watch.",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          offset: Offset(2, 2),
                          blurRadius: 4,
                          color: Colors.black45,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Your movie journey starts here.",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      // Add navigation or action here
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.deepPurple,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                    ),
                    child: const Text(
                      "Get Started",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Popular Section
          const SizedBox(height: 10), // Add some spacing
          const PopularContainer(),
        ],
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: const BottomNavBar(currentIndex: 0),
    );
  }
}
