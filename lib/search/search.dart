import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/movie_model.dart';
import '../movie_details/movie_details.dart';
import '../services/search.dart';
import '../shared/bottom_nav.dart';
import 'search_bar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Movie> _movie = [];

  void _performSearch(String query) async {
    if (query.isEmpty) {
      setState(() {
        _movie = [];
      });
      return;
    }
    List<dynamic> results = await sendQueryToBackendSearch(query);

    setState(() {
      _movie = results.map((movie) => Movie.fromJson(movie)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
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
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CustomSearchBar(onSearch: _performSearch),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
          Expanded(
            child: _movie.isEmpty
                ? const Column(
                    // Removed the nested `Expanded`
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(CupertinoIcons.film, size: 100, color: Colors.grey),
                      SizedBox(height: 20),
                      Text(
                        "Search for your favorite films to rate them !",
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                : ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: _movie.length,
                    itemBuilder: (context, index) {
                      final movie = _movie[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.white70),
                            ),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      MovieDetailsScreen(movie: movie),
                                ),
                              );
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 100,
                                  height: 150,
                                  child: movie.posterPath.isNotEmpty
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Image.network(
                                            'https://image.tmdb.org/t/p/original${movie.posterPath}',
                                            fit: BoxFit.fill,
                                            loadingBuilder: (context, child,
                                                loadingProgress) {
                                              if (loadingProgress == null) {
                                                return child;
                                              } else {
                                                return const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                );
                                              }
                                            },
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return const Icon(
                                                  Icons.image_not_supported,
                                                  size: 100);
                                            },
                                          ),
                                        )
                                      : const Icon(Icons.image_not_supported,
                                          size: 100),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        movie.title,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        movie.overview,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 14,
                                            color:
                                                Colors.white.withOpacity(0.7)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 1),
    );
  }
}
