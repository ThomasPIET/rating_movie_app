import 'package:flutter/material.dart';

import '../services/search.dart';
import 'search_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> _searchResults = [];

  void _performSearch(String query) async {
    List<dynamic> results = await sendQueryToBackend(query);

    setState(() {
      _searchResults = results;
    });

    if (query.isEmpty) {
      setState(() {
        _searchResults = [];
      });
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Column(
        children: [
          const SizedBox(height: 20),
          CustomSearchBar(onSearch: _performSearch),
          const SizedBox(height: 20),
          Expanded(
            child: _searchResults.isEmpty
                ? const Center(child: Text('No results'))
                : ListView.builder(
                    itemCount: _searchResults.length,
                    itemBuilder: (context, index) {
                      final movie = _searchResults[index];
                      return ListTile(
                        title: Text(movie['name']),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
