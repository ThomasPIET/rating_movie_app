import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/movie_model.dart';

class MyListServices {
  Future<void> addMovieToUser(String userId, Map<String, dynamic> movie) async {
    try {
      final moviesRef = FirebaseFirestore.instance
          .collection('UserID')
          .doc(userId)
          .collection('movies');

      final snapshot =
          await moviesRef.where('title', isEqualTo: movie['title']).get();
      if (snapshot.docs.isNotEmpty) {
        print("Film déjà dans la liste !");
        return;
      }

      await moviesRef.add(movie);

      print("Film ajouté avec succès !");
    } catch (e) {
      print("Erreur lors de l'ajout du film : $e");
    }
  }

  Future<List<Movie>> getFilmsForUser(String userId) async {
    try {
      final moviesRef = FirebaseFirestore.instance
          .collection('UserID')
          .doc(userId)
          .collection('movies');

      final snapshot = await moviesRef.get();
      return snapshot.docs.map((doc) {
        final data = doc.data();
        return Movie(
          id: data['id'] ?? 0,
          title: data['title'] ?? 'Title not found',
          overview: data['overview'] ?? 'Overview not found',
          posterPath: data['poster_path'] ?? '',
          releaseDate: data['release_date'] ?? 'Unknown',
          voteAverage: (data['vote_average'] ?? 0).toDouble(),
          userRating: data['user_rating'] ?? 0,
        );
      }).toList();
    } catch (e) {
      print("Erreur lors de la récupération des films : $e");
      return [];
    }
  }

  Future<void> updateMovieRating(
      String userId, int movieId, int rating) async {
    try {
      final moviesRef = FirebaseFirestore.instance
          .collection('UserID')
          .doc(userId as String?)
          .collection('movies');

      final snapshot = await moviesRef.where('id', isEqualTo: movieId).get();
      if (snapshot.docs.isNotEmpty) {
        await snapshot.docs.first.reference.update({'user_rating': rating});
        print("Note mise à jour avec succès !");
      } else {
        print("Film non trouvé dans la liste !");
      }
    } catch (e) {
      print("Erreur lors de la mise à jour de la note : $e");
    }
  }
}
