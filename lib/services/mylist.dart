import 'package:cloud_firestore/cloud_firestore.dart';

class MyListServices {


  Future<void> addMovieToUser(String userId, Map<String, dynamic> movie) async {
    try {
      final moviesRef = FirebaseFirestore.instance
          .collection('UserID')
          .doc(userId)
          .collection('movies');


      final snapshot = await moviesRef.where('title', isEqualTo: movie['title']).get();
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


}
