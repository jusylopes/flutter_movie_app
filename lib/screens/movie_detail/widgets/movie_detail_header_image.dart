import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_detail_model.dart';
import 'package:movie_app/utils/strings.dart';

class MovieDetailHeaderImage extends StatelessWidget {
  const MovieDetailHeaderImage({
    super.key,
    required MovieDetailModel movie,
  }) : _movie = movie;

  final MovieDetailModel _movie;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600),
        child: Container(
          width: double.infinity,
          height: screenHeight / 2,
          foregroundDecoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff1b1b1b),
                Colors.transparent,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.center,
              stops: [0, 0.6],
            ),
          ),
          child: Center(
            child: Image.network(
                width: screenWidth * 2,
                fit: BoxFit.cover,
                '${MovieStrings.urlImagePoster}${_movie.backdropPath}'),
          ),
        ),
      ),
    );
  }
}
