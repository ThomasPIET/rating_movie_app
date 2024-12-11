import 'package:flutter/material.dart';

import '../services/search.dart';
import '../shared/bottom_nav.dart';
import 'search_bar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<dynamic> _searchResults = [];

  void _performSearch(String query) async {
    if (query.isEmpty) {
      setState(() {
        _searchResults = [];
      });
      return;
    }
    List<dynamic> results = await sendQueryToBackend(query);

    setState(() {
      _searchResults = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFF222222),
              ),
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF222222),
                    ),
                    height: 110,
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 50, left: 20),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'RateFlix',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
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
              child: _searchResults.isEmpty
                  ? const Center(
                      child: Text('No results'),
                    )
                  : ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: _searchResults.length,
                      itemBuilder: (context, index) {
                        final movie = _searchResults[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              decoration: const BoxDecoration(
                                  border: Border(
                                bottom: BorderSide(color: Colors.white70),
                              )),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamed('/movie',
                                      arguments: movie['id']);
                                },
                                icon: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 100,
                                      height: 150,
                                      child: movie['poster_path'] != null
                                          ? Image.network(
                                              'https://image.tmdb.org/t/p/original${movie['poster_path']}',
                                              fit: BoxFit.cover,
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
                                            )
                                          : const Icon(
                                              Icons.image_not_supported,
                                              size: 100),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            movie['title'] ?? 'Title not found',
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            movie['overview'] ??
                                                'No description available.',
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 14,
                                                height: 1.7,
                                                color: Colors.white
                                                    .withOpacity(0.7)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        );
                      },
                    ),
            ),
          ],
        ),
        bottomNavigationBar: const BottomNavBar(currentIndex: 1));
  }
}
