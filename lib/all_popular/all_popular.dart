import 'package:flutter/material.dart';

import '../model/movie_model.dart';
import '../movie_details/movie_details.dart';
import '../services/popular.dart';

class AllPopularScreen extends StatefulWidget {
  const AllPopularScreen({super.key});

  @override
  State<AllPopularScreen> createState() => _AllPopularScreenState();
}

class _AllPopularScreenState extends State<AllPopularScreen> {
  List<Movie> _movies = [];

  @override
  void initState() {
    super.initState();
    _getPopularMovies();
  }

  void _getPopularMovies() async {
    List<dynamic> results = await sendQueryToBackendPopular('popular');
    setState(() {
      _movies = results.map((movie) => Movie.fromJson(movie)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Popular Movies'),
        backgroundColor: Colors.transparent,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        primary: false,
        children: [
          for (Movie movie in _movies)
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetailsScreen(movie: movie),
                  ),
                );
              },
              child: Column(
                children: [
                  SizedBox(
                    width: 145,
                    height: 170,
                    child: movie.posterPath.isNotEmpty
                        ? ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/original${movie.posterPath}',
                        fit: BoxFit.fill,
                        loadingBuilder:
                            (context, child, loadingProgress) {
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
                  const SizedBox(height: 5),
                  Text(
                    movie.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
