import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/popular_movie/popular_movie_cubit.dart';
import 'package:movie_app/cubit/popular_movie/popular_movie_state.dart';
import 'package:movie_app/models/popular_movie_model.dart';
import 'package:movie_app/widgets/gridview_movie.dart';
import 'package:movie_app/widgets/reload_state_button.dart';

class PopularMoviePage extends StatefulWidget {
  const PopularMoviePage({super.key});

  @override
  State<PopularMoviePage> createState() => _PopularMovie();
}

class _PopularMovie extends State<PopularMoviePage> {
  final List<PopularMovieModel> _movies = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _onScroll();
  }

  void _onScroll() {
    _scrollController.addListener(() async {
      if (_scrollController.position.maxScrollExtent ==
              _scrollController.offset &&
          !context.read<PopularMovieCubit>().isLoading) {
        context.read<PopularMovieCubit>().getPopularMovies();
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
          if (state is InitialState || state is LoadingState) {
            const Center(child: CircularProgressIndicator());
          } else if (state is ErrorState) {
            return Center(
              child: ReloadStateButton(
                  maxHeight: maxHeight,
                  onPressed: () {
                    context.read<PopularMovieCubit>().getPopularMovies();
                  }),
            );
          } else if (state is SuccessState) {
            _movies.addAll(state.popularMovies);
          }
          return GridViewMovie(
              maxHeight: maxHeight,
              maxWidth: maxWidth,
              scrollController: _scrollController,
              movie: _movies);
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
