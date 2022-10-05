import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/movie_detail/movie_detail_cubit.dart';
import 'package:movie_app/cubit/popular_movie/popular_movie_cubit.dart';
import 'package:movie_app/services/movie_repository.dart';
import 'package:movie_app/views/movie_detail_page.dart';
import 'package:movie_app/views/movie_home_page.dart';

abstract class Routes {
  static const String inicial = '/inicial';
  static const String movieDetail = '/movie_detail';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case inicial:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => PopularMovieCubit(repository: MovieRepository()),
            child: const MovieHomePage(),
          ),
        );
      case movieDetail:
        final moveId = settings.arguments as int;

        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => MovieDetailCubit(repository: MovieRepository()),
            child: MovieDetailPage(movieId: moveId),
          ),
        );
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child:
                          Text('Nenhuma rota definida para ${settings.name}')),
                ));
    }
  }
}
