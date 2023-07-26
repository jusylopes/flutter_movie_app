import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/blocs/trending/trending_bloc.dart';
import 'package:movie_app/blocs/trending/trending_state.dart';
import 'package:movie_app/models/trending_model.dart';
import 'package:movie_app/screens/widgets/error_message.dart';
import 'package:movie_app/screens/widgets/movie_grid_view.dart';

class TrendingMovieScreen extends StatefulWidget {
  const TrendingMovieScreen({super.key});

  @override
  State<TrendingMovieScreen> createState() => _TrendingMovieScreenState();
}

class _TrendingMovieScreenState extends State<TrendingMovieScreen>
    with AutomaticKeepAliveClientMixin<TrendingMovieScreen> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    List<MovieTrendingModel> movies = [];

    return BlocBuilder<TrendingMovieBloc, TrendingMovieState>(
      builder: (context, state) {
        if (state is InitialState || state is LoadingState && movies.isEmpty) {
          return Center(
            child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor),
          );
        } else if (state is ErrorState) {
          return const ErrorMessage();
        } else if (state is SuccessState) {
          movies = state.trendingMovies;
        }

        return MovieGridView(movie: movies);
      },
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => throw UnimplementedError();
}
