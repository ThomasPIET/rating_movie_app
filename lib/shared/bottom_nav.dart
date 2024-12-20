import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ratingmoviesapp/search/search.dart';

import '../home/home.dart';
import '../profile/profile.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;

  const BottomNavBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(
        top: BorderSide(
          color: Colors.white70,
          width: 0.3,
        ),
      )),
      child: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        currentIndex: currentIndex,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white70,
        selectedLabelStyle: const TextStyle(
          fontSize: 10,
          height: 2.2,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 10,
          height: 2.2,
        ),
        iconSize: 20,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.house), label: ' Home'),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.magnifyingGlass), label: 'About'),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.solidUser), label: 'Profile'),
        ],
        onTap: (index) {
          if (currentIndex == index) return;

          Widget targetPage;
          switch (index) {
            case 0:
              targetPage = const HomeScreen();
              break;
            case 1:
              targetPage = const SearchScreen();
              break;
            case 2:
              targetPage =   ProfileScreen();
              break;
            default:
              return;
          }

          Navigator.of(context).pushReplacement(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  targetPage,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeThroughTransition(
                  animation: animation,
                  secondaryAnimation: secondaryAnimation,
                  child: child,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
