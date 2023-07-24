import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/blocs/popular/popular_bloc.dart';
import 'package:movie_app/blocs/popular/popular_event.dart';
import 'package:movie_app/blocs/popular/popular_state.dart';
import 'package:movie_app/screens/widgets/error_message.dart';
import 'package:movie_app/screens/widgets/movie_grid_view.dart';

class PopularMovieScreen extends StatefulWidget {
  const PopularMovieScreen({super.key});

  @override
  State<PopularMovieScreen> createState() => _PopularMovieScreenState();
}

class _PopularMovieScreenState extends State<PopularMovieScreen>
    with AutomaticKeepAliveClientMixin<PopularMovieScreen> {
  late ScrollController _scrollController;
  final List _movies = [];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    fetchPopularMoviesOnScroll();
  }

  void fetchPopularMoviesOnScroll() {
    _scrollController.addListener(() {
      if (_scrollController.offset ==
              _scrollController.position.maxScrollExtent &&
          !BlocProvider.of<PopularMovieBloc>(context).isFetching) {
        BlocProvider.of<PopularMovieBloc>(context)
          ..isFetching = true
          ..add(PopularMovieFetchEvent());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocConsumer<PopularMovieBloc, PopularMovieState>(
      listener: (context, state) {
        if (state is LoadingState) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text(('Loading movies...'))));
        }
      },
      builder: (context, state) {
        if (state is InitialState || state is LoadingState && _movies.isEmpty) {
          return Center(
            child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor),
          );
        } else if (state is ErrorState) {
          return const ErrorMessage();
        } else if (state is SuccessState) {
          _movies.addAll(state.popularMovies);
          BlocProvider.of<PopularMovieBloc>(context).isFetching = false;
        }

        return MovieGridView(movie: _movies, controller: _scrollController);
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
