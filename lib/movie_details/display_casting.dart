import 'package:flutter/material.dart';
import 'package:ratingmoviesapp/model/casting_model.dart';
import 'package:ratingmoviesapp/services/credits.dart';

class DisplayCasting extends StatefulWidget {

  final int movieId;

  const DisplayCasting({super.key, required this.movieId});

  @override
  State<DisplayCasting> createState() => _DisplayCastingState();
}

class _DisplayCastingState extends State<DisplayCasting> {
  List<Casting> _casting = [];

  @override
  void initState() {
    super.initState();
    _getPopularMovies();
  }

  void _getPopularMovies() async {
    List<dynamic> results = await sendQueryToBackendCasting(widget.movieId);
    setState(() {
      _casting = results.map((movie) => Casting.fromJson(movie)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            SizedBox(width: 23),
             Text(
              'Casting',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
             Spacer(),
          ],
        ),
        Row(
          children: [
            const SizedBox(width: 5),
            Expanded(
              child: SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _casting.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500${_casting[index].profilePath}'),
                              radius: 50,
                            ),
                          ),
                            const SizedBox(height: 10),
                          Text(
                            _casting[index].name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Text(
                            _casting[index].character,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
