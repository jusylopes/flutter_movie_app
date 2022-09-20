import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/popular_movie/popular_movie_cubit.dart';
import 'package:movie_app/cubit/popular_movie/popular_movie_state.dart';

class MovieHomePage extends StatefulWidget {
  const MovieHomePage({Key? key}) : super(key: key);

  @override
  State<MovieHomePage> createState() => _MovieHomePageState();
}

class _MovieHomePageState extends State<MovieHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie App'),
      ),
      body: BlocBuilder<PopularMovieCubit, PopularMovieState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ErrorState) {
            return const Center(child: Icon(Icons.close));
          } else if (state is SuccessState) {
            final movies = state.popularMovies;

            return ListView.builder(
              itemCount: movies.results.length,
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  title: Text(movies.results[index].title),
                  leading: const CircleAvatar(),
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
