import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_detail_model.dart';
import 'package:movie_app/utils/strings.dart';

class MovieDetailWidget extends StatelessWidget {
  const MovieDetailWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final MovieDetailModel movie;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ConstrainedBox(
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
                    '${MovieStrings.urlImagePoster}${movie.backdropPath}'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              movie.title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              'Overview',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          Expanded(
              child: Scrollbar(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Text(movie.overview,
                    style: Theme.of(context).textTheme.bodySmall),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
