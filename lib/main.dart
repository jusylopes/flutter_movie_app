import 'package:flutter/material.dart';
import 'package:movie_app/cubit/popular_movie/popular_movie_cubit.dart';
import 'package:movie_app/utils/routes.dart';
import 'package:movie_app/services/movie_repository.dart';
import 'package:movie_app/utils/theme.dart';
import 'package:movie_app/views/movie_home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: MovieTheme.dark,
      initialRoute: Routes.inicial,
      routes: {
        Routes.inicial: (context) => BlocProvider(
              create: (_) => PopularMovieCubit(repository: MovieRepository()),
              child: const MovieHomePage(),
            ),
      },
    );
  }
}
