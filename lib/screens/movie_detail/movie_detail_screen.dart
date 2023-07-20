import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/movie_detail/movie_detail_cubit.dart';
import 'package:movie_app/cubit/movie_detail/movie_detail_state.dart';
import 'package:movie_app/screens/movie_detail/movie_detail_widget.dart';
import 'package:movie_app/screens/widgets/error_message.dart';

class MovieDetailScreen extends StatefulWidget {
  final int movieId;

  const MovieDetailScreen({super.key, required this.movieId});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late MovieDetailCubit _movieDetailCubit;

  @override
  void initState() {
    _movieDetailCubit = BlocProvider.of<MovieDetailCubit>(context);
    _movieDetailCubit.getMovieDetail(id: widget.movieId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      extendBodyBehindAppBar: true,
      body: BlocBuilder<MovieDetailCubit, MovieDetailState>(
        builder: (context, state) {
          if (state is InitialState || state is LoadingState) {
            return Center(
              child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor),
            );
          } else if (state is SuccessState) {
            return MovieDetailWidget(movie: state.movie);
          } else {
            return const ErrorMessage();
          }
        },
      ),
    );
  }
}
