import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:numberpicker/numberpicker.dart';
import '../services/mylist.dart';

class RatingComponents extends StatefulWidget {
  final int  movieId;
  final String userId;

  const RatingComponents({super.key, required this.movieId, required this.userId});

  @override
  State<RatingComponents> createState() => _RatingComponentsState();
}

class _RatingComponentsState extends State<RatingComponents> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NumberPicker(
          value: _rating,
          axis: Axis.horizontal,
          minValue: 0,
          maxValue: 10,
          onChanged: (value) => setState(() => _rating = value),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.amber,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 5,
          ),
          onPressed: () async {
            try {
              await MyListServices().updateMovieRating(widget.userId, widget.movieId, _rating);

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('You rated this movie $_rating stars'),
                  duration: const Duration(seconds: 2),
                ),
              );
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Error saving rating: $e'),
                  duration: const Duration(seconds: 2),
                ),
              );
            }
          },
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Rate',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 10),
              Icon(
                FontAwesomeIcons.star,
                size: 18,
              ),
            ],
          ),
        )
      ],
    );
  }
}
