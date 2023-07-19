import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/popular/popular_cubit.dart';
import 'package:movie_app/cubit/popular/popular_state.dart';
import 'package:movie_app/screens/widgets/error_message.dart';

import 'package:movie_app/screens/widgets/grid_view_movie.dart';

class PopularMovieScreen extends StatefulWidget {
  const PopularMovieScreen({super.key});

  @override
  State<PopularMovieScreen> createState() => _PopularMovie();
}

class _PopularMovie extends State<PopularMovieScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularMovieCubit, PopularMovieState>(
      builder: (context, state) {
        if (state is InitialState || state is LoadingState) {
          return Center(
            child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor),
          );
        } else if (state is SuccessState) {
          final List movies = state.movies;
          return GridViewMovie(movie: movies);
        } else {
          return const ErrorMessage();
        }
      },
    );
  }
}
