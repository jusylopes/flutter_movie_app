
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/models/movie_detail_model.dart';
import 'package:movie_app/screens/movie_detail/widgets/movie_star_rating.dart';

class MovieDetailBody extends StatelessWidget {
  const MovieDetailBody({super.key, required MovieDetailModel movie}) : _movie = movie;

  final MovieDetailModel _movie;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${_movie.title} (${getFormattedReleaseData(_movie.releaseDate)})',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          MovieStarRating(rating: _movie.voteAverage),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child:
                Text('Overview', style: Theme.of(context).textTheme.titleSmall),
          ),
          Text(_movie.overview, style: Theme.of(context).textTheme.bodySmall)
        ],
      ),
    );
  }
}

String getFormattedReleaseData(DateTime releaseDate) {
  String formattedYear = DateFormat('yyyy').format(releaseDate);
  return formattedYear;
}
