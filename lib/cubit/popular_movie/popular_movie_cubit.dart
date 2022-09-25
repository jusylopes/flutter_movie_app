import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/popular_movie/popular_movie_state.dart';
import 'package:movie_app/models/popular_movie_model.dart';
import 'package:movie_app/services/movie_repository.dart';

class PopularMovieCubit extends Cubit<PopularMovieState> {
  PopularMovieCubit({required this.repository}) : super(InitialState()) {
    getPopularMovies();
  }

  final MovieRepository repository;
  int page = 1;
  bool isFetching = false;

  void getPopularMovies() async {
    try {
      emit(LoadingState());
      print('loading');

      PopularMovieModel response =
          await repository.getPopularMovies(page: page);
          
      page++;
      print('success');
      emit(SuccessState(response));
    } catch (e) {
      emit(ErrorState());
    }
  }
}
