import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/movie_detail/movie_detail_cubit.dart';
import 'package:movie_app/cubit/movie_detail/movie_detail_state.dart';
import 'package:movie_app/widgets/reload_state_button.dart';

class MovieDetailPage extends StatefulWidget {
  final int movieId;

  const MovieDetailPage({super.key, required this.movieId});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  void initState() {
    super.initState();
    _loadMovie();
  }

  _loadMovie() async {
    BlocProvider.of<MovieDetailCubit>(context)
        .getMovieDetail(id: widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        // final double maxWidth = constraints.maxWidth;
        final double maxHeight = constraints.maxHeight;

        return BlocBuilder<MovieDetailCubit, MovieDetailState>(
          builder: (context, state) {
            if (state is InitialState || state is LoadingState) {
              const Center(child: CircularProgressIndicator());
            } else if (state is ErrorState) {
              return Center(
                child: ReloadStateButton(
                    maxHeight: maxHeight, onPressed: _loadMovie),
              );
            } else if (state is SuccessState) {
              final movie = state.movies;

              return Center(
                child: Text(movie.title),
              );
            }
            return const Center();
          },
        );
      }),
    );
  }
}
