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
          Container(
            decoration:  BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            height: 110,
            child: Container(
              padding: const EdgeInsets.only(top: 50, left: 10),
              child: Row(
                children: [
                  SizedBox.fromSize(
                    size: const Size(56, 56),
                    child: ClipOval(
                      child: Image.asset('assets/logo.png'),
                    ),
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'RateFlix',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Column(
            children: [
              PopularContainer()
            ],
          )
        ],
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 0),
    );
  }
}
