import 'package:flutter/material.dart';
import 'package:ratingmoviesapp/community/community.dart';
import 'package:animations/animations.dart';

import '../home/home.dart';
import '../profile/profile.dart';


class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  const BottomNavBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      onTap: (index) {
        if (currentIndex == index) return;

        Widget targetPage;
        switch (index) {
          case 0:
            targetPage = const HomeScreen();
            break;
          case 1:
            targetPage = const CommunityScreen();
            break;
          case 2:
            targetPage = const ProfileScreen();
            break;
          default:
            return;
        }

        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => targetPage,
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeThroughTransition(
                animation: animation,
                secondaryAnimation: secondaryAnimation,
                child: child,
              );
            },
          ),
        );
      },
    );
  }
}