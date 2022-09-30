import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/popular_movie/popular_movie_cubit.dart';
import 'package:movie_app/cubit/popular_movie/popular_movie_state.dart';
import 'package:movie_app/models/popular_movie_model.dart';
import 'package:movie_app/widgets/gridview_movie.dart';
import 'package:movie_app/widgets/reload_state_button.dart';

class PopularMovie extends StatefulWidget {
  const PopularMovie({super.key});

  @override
  State<PopularMovie> createState() => _PopularMovie();
}

class _PopularMovie extends State<PopularMovie> {
  final List<PopularMovieModel> movies = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    onScroll();
  }

  void onScroll() {
    _scrollController.addListener(() async {
      if (_scrollController.position.maxScrollExtent ==
              _scrollController.offset &&
          !BlocProvider.of<PopularMovieCubit>(context).isLoading) {
        BlocProvider.of<PopularMovieCubit>(context).getPopularMovies();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final double maxWidth = constraints.maxWidth;
      final double maxHeight = constraints.maxHeight;

      return BlocBuilder<PopularMovieCubit, PopularMovieState>(
        builder: (context, state) {
          if (state is InitialState ||
              state is LoadingState && movies.isEmpty) {
            const Center(child: CircularProgressIndicator());
          } else if (state is ErrorState) {
            return Center(
              child: ReloadStateButton(maxHeight: maxHeight),
            );
          } else if (state is SuccessState) {
            movies.addAll(state.popularMovies);
          }
          return GridViewMovie(
              maxHeight: maxHeight,
              maxWidth: maxWidth,
              scrollController: _scrollController,
              movie: movies);
        },
      );
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
