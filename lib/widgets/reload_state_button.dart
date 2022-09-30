import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/popular_movie/popular_movie_cubit.dart';

class ReloadStateButton extends StatelessWidget {
  const ReloadStateButton({
    Key? key,
    required this.maxHeight,
  }) : super(key: key);

  final double maxHeight;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: maxHeight / 6,
      onPressed: () {
        BlocProvider.of<PopularMovieCubit>(context)
            .getPopularMovies();
      },
      color: Theme.of(context).colorScheme.primary,
      splashColor: Theme.of(context).colorScheme.background,
      icon: const Icon(
        Icons.refresh,
      ),
    );
  }
}