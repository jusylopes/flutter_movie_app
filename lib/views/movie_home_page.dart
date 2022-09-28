import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/popular_movie/popular_movie_cubit.dart';
import 'package:movie_app/cubit/popular_movie/popular_movie_state.dart';
import 'package:movie_app/models/popular_movie_model.dart';

class MovieHomePage extends StatefulWidget {
  const MovieHomePage({super.key});

  @override
  State<MovieHomePage> createState() => _MovieHomePageState();
}

class _MovieHomePageState extends State<MovieHomePage> {
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
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Movie App 🍿'),
        ),
        body: BlocBuilder<PopularMovieCubit, PopularMovieState>(
          builder: (context, state) {
            if (state is InitialState ||
                state is LoadingState && movies.isEmpty) {
              const Center(child: CircularProgressIndicator());
            } else if (state is ErrorState) {
              return Center(
                child: IconButton(
                  iconSize: size.width / 5,
                  onPressed: () {
                    BlocProvider.of<PopularMovieCubit>(context)
                        .getPopularMovies();
                  },
                  color: Theme.of(context).colorScheme.secondary,
                  splashColor: Theme.of(context).colorScheme.background,
                  icon: const Icon(
                    Icons.refresh,
                  ),
                ),
              );
            } else if (state is SuccessState) {
              movies.addAll(state.popularMovies);
            }
            return Scrollbar(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.70),
                controller: _scrollController,
                itemCount: movies.length,
                itemBuilder: (context, index) => Card(
                  margin: EdgeInsets.zero,
                  child: Container(
                    // title: Text(movies[index].title),

                    child: Image.network(
                      'https://image.tmdb.org/t/p/w220_and_h330_face${movies[index].posterPath}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
