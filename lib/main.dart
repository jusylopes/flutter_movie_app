import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/movie_detail/movie_detail_cubit.dart';
import 'package:movie_app/cubit/popular/popular_cubit.dart';
import 'package:movie_app/cubit/trending/trending_cubit.dart';
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
          create: (_) => MovieDetailCubit(repository: MovieRepository()),
        ),
        BlocProvider(
          create: (_) => TrendingMovieCubit(repository: MovieRepository()),
        ),
        BlocProvider(
          create: (_) => PopularMovieCubit(repository: MovieRepository()),
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
