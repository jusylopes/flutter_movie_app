import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/popular_movie/popular_movie_state.dart';
import 'package:movie_app/models/popular_movie_model.dart';
import 'package:movie_app/services/movie_repository.dart';

class PopularMovieCubit extends Cubit<PopularMovieState> {
  PopularMovieCubit({required this.repository}) : super(InitialState()) {
    getPopularMovies();
  }

  final MovieRepository repository;

  void getPopularMovies() async {
    try {
      emit(LoadingState());

      PopularMovieModel popularMovieResponse =
          await repository.getPopularMovies();

      emit(SuccessState(popularMovieResponse));
    } catch (e) {
      emit(ErrorState());
    }
  }
}
