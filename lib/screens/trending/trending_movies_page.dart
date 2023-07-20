import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/trending/trending_cubit.dart';
import 'package:movie_app/cubit/trending/trending_state.dart';
import 'package:movie_app/screens/widgets/error_message.dart';
import 'package:movie_app/screens/widgets/grid_view_movie.dart';

class TrendingMoviesPage extends StatefulWidget {
  const TrendingMoviesPage({super.key});

  @override
  State<TrendingMoviesPage> createState() => _PopularMovie();
}

class _PopularMovie extends State<TrendingMoviesPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingMovieCubit, TrendingMovieState>(
      builder: (context, state) {
        if (state is InitialState || state is LoadingState) {
          return Center(
            child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor),
          );
        } else if (state is SuccessState) {
          final List movies = state.trendingMovies;
          return GridViewMovie(movie: movies);
        } else {
          return const ErrorMessage();
        }
      },
    );
  }
}
