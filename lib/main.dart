import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:movie_app/blocs/popular/popular_bloc.dart';
import 'package:movie_app/blocs/popular/popular_event.dart';
import 'package:movie_app/blocs/trending/trendig_event.dart';
import 'package:movie_app/blocs/trending/trending_bloc.dart';
import 'package:movie_app/utils/strings.dart';
import 'package:movie_app/utils/theme.dart';
import 'package:movie_app/screens/home/home_screen.dart';
import 'package:movie_app/repositories/movie_repository.dart';

void main() {
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => MovieDetailBloc(
            repository: MovieRepository(),
          ),
        ),
        BlocProvider(
          create: (_) => TrendingMovieBloc(
            repository: MovieRepository(),
          )..add(
              TrendingMovieFetchEvent(),
            ),
        ),
        BlocProvider(
          create: (context) => PopularMovieBloc(
            repository: MovieRepository(),
          )..add(
              PopularMovieFetchEvent(),
            ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: MovieStrings.appName,
        theme: MovieTheme.dark,
        home: const HomeSreen(),
      ),
    );
  }
}
