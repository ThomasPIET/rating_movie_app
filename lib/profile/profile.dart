import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ratingmoviesapp/profile/mylist_container.dart';
import 'package:ratingmoviesapp/shared/bottom_nav.dart';

import '../services/auth.dart';

class ProfileScreen extends StatelessWidget {
  final User? user = AuthServices().user;

  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mon Profil"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              AuthServices().signOut();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/', (route) => false);
            },
          ),
        ],
      ),
      body: user != null
          ?
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: user!.photoURL != null
                      ? NetworkImage(user!.photoURL!)
                      : const AssetImage('assets/default_avatar.png')
                  as ImageProvider,
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    Text(
                      user!.displayName ?? "Unknown",
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      user!.email ?? "Email unavailable",
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const MyListContainer(),
        ],
      )

          : const Center(
              child: Text("User not found"),
            ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 2),
    );
  }
}
