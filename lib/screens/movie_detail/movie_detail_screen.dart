import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:movie_app/blocs/movie_detail/movie_detail_event.dart';
import 'package:movie_app/blocs/movie_detail/movie_detail_state.dart';
import 'package:movie_app/screens/movie_detail/widgets/movie_detail_body.dart';
import 'package:movie_app/screens/movie_detail/widgets/movie_detail_header_image.dart';
import 'package:movie_app/screens/widgets/error_message.dart';

class MovieDetailScreen extends StatefulWidget {
  final int _movieId;

  const MovieDetailScreen({super.key, required int movieId})
      : _movieId = movieId;

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late MovieDetailBloc _movieDetailBloc;

  @override
  void initState() {
    super.initState();
    _movieDetailBloc = BlocProvider.of<MovieDetailBloc>(context);
    _movieDetailBloc.add(MovieDetailFetchEvent(widget._movieId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      extendBodyBehindAppBar: true,
      body: BlocBuilder<MovieDetailBloc, MovieDetailState>(
        builder: (context, state) {
          if (state is InitialState || state is LoadingState) {
            return Center(
              child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor),
            );
          } else if (state is ErrorState) {
            return const ErrorMessage();
          } else if (state is SuccessState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MovieDetailHeaderImage(movie: state.movie),
                MovieDetailBody(movie: state.movie)
              ],
              
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
