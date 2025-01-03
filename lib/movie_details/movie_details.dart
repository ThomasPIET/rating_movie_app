import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ratingmoviesapp/model/movie_model.dart';
import 'package:ratingmoviesapp/movie_details/display_casting.dart';
import 'package:ratingmoviesapp/movie_details/rating_components.dart';
import 'package:ratingmoviesapp/services/mylist.dart';

import '../services/auth.dart';

class MovieDetailsScreen extends StatelessWidget {
  final User? user = AuthServices().user;

  final Movie movie;

  MovieDetailsScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                    fit: BoxFit.cover,
                    height: 300,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        movie.releaseDate,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: IconButton(
                              icon: const FaIcon(FontAwesomeIcons.plus),
                              onPressed: () {
                                MyListServices().addMovieToUser(user!.uid, {
                                  'title': movie.title,
                                  'poster_path': movie.posterPath,
                                  'release_date': movie.releaseDate,
                                  'overview': movie.overview,
                                  'vote_average': movie.voteAverage,
                                });
                              },
                              iconSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            "Add to my list ",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                movie.overview,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Public rating : ${movie.voteAverage}',
                style: const TextStyle(fontSize: 16),
              ),
            ),
            RatingComponents(
              movieId: movie.id,
              userId: user!.uid,
            ),
            DisplayCasting(movieId: movie.id),
          ],
        ),
      ),
    );
  }
}
