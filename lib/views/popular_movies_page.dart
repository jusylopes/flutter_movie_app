import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/popular_movies/popular_movies_cubit.dart';
import 'package:movie_app/cubit/popular_movies/popular_movies_state.dart';
import 'package:movie_app/models/movie_popular_model.dart';
import 'package:movie_app/widgets/gridview_movie.dart';

class PopularMoviesPage extends StatefulWidget {
  const PopularMoviesPage({super.key});

  @override
  State<PopularMoviesPage> createState() => _PopularMovie();
}

class _PopularMovie extends State<PopularMoviesPage> {
  final List<MoviePopularModel> _movies = [];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final double maxWidth = constraints.maxWidth;
      final double maxHeight = constraints.maxHeight;

      return BlocBuilder<PopularMoviesCubit, PopularMoviesState>(
        builder: (context, state) {
          if (state is InitialState || state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ErrorState) {
            return const Center(
              child: Text('erro'),
            );
          } else if (state is SuccessState) {
            _movies.addAll(state.popularMovies);
          }
          return GridViewMovie(
              maxHeight: maxHeight, maxWidth: maxWidth, movie: _movies);
        },
      );
    });
  }
}
