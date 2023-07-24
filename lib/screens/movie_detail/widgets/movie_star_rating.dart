import 'package:flutter/material.dart';

class MovieStarRating extends StatelessWidget {
  final double _rating;
  const MovieStarRating({super.key, required double rating}) : _rating = rating;

  @override
  Widget build(BuildContext context) {
    int fullStars = _rating.floor();
    bool hasHalfStar = (_rating - fullStars) >= 0.5;
    Color iconColorStar = Colors.amber;
    double iconSizeStar = 20;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(10, (index) {
        if (index < fullStars) {
          return Icon(
            Icons.star,
            color: iconColorStar,
            size: iconSizeStar,
          );
        } else if (index == fullStars && hasHalfStar) {
          return Icon(
            Icons.star_half,
            color: iconColorStar,
            size: iconSizeStar,
          );
        } else {
          return Icon(
            Icons.star_border,
            color: iconColorStar,
            size: iconSizeStar,
          );
        }
      }),
    );
  }
}
