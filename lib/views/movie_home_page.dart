import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/popular_movie/popular_movie_cubit.dart';
import 'package:movie_app/cubit/popular_movie/popular_movie_state.dart';

class MovieHomePage extends StatefulWidget {
  const MovieHomePage({super.key});

  @override
  State<MovieHomePage> createState() => _MovieHomePageState();
}

class _MovieHomePageState extends State<MovieHomePage> {
  final List movies = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    onScroll();
  }

  void onScroll() {
    _scrollController.addListener(() async {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.position.pixels) {
        BlocProvider.of<PopularMovieCubit>(context).isLoading = false;
        BlocProvider.of<PopularMovieCubit>(context).getPopularMovies();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Movie App 🍿'),
        ),
        body: BlocBuilder<PopularMovieCubit, PopularMovieState>(
          builder: (context, state) {
            if (state is LoadingState) {
              const Center(child: CircularProgressIndicator());
            } else if (state is ErrorState) {
              return const Center(child: Icon(Icons.close));
            } else if (state is SuccessState) {
              movies.addAll(state.popularMovies);

              return Scrollbar(
                  child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                controller: _scrollController,
                itemCount: movies.length,
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    title: Text(movies[index].title),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://image.tmdb.org/t/p/w220_and_h330_face${movies[index].posterPath}',
                      ),
                    ),
                  ),
                ),
              ));
            }
            return const Center();
          },
        ));
  }
   @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
