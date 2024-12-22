import 'package:flutter/material.dart';
import 'package:ratingmoviesapp/model/movie_model.dart';

import '../movie_details/movie_details.dart';
import '../services/popular.dart';

class PopularContainer extends StatefulWidget {
  const PopularContainer({super.key});

  @override
  State<PopularContainer> createState() => _PopularContainerState();
}

class _PopularContainerState extends State<PopularContainer> {
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
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(width: 15),
            const Text(
              'Popular Movies',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            TextButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/all_popular');
              },
              label: const Text(
                'View All',
                style: TextStyle(color: Colors.white70),
              ),
              icon: const Icon(Icons.arrow_forward, color: Colors.white70),
              iconAlignment: IconAlignment.end,
            ),
          ],
        ),
        SizedBox(
          height: 273,
          child: _movies.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    final movie = _movies[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MovieDetailsScreen(movie: movie)));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 15),
                        width: 140,
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
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              movie.releaseDate,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white70,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
