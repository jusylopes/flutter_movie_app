import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/popular/popular_state.dart';
import 'package:movie_app/repositories/movie_repository.dart';

class PopularMovieCubit extends Cubit<PopularMovieState> {
  PopularMovieCubit({required this.repository}) : super(InitialState()) {
    getPopularMovies();
  }

  final MovieRepository repository;
  int initialPage = 1;
  bool isLoading = false;

  void getPopularMovies() async {
    try {
      emit(LoadingState());
      isLoading = true;
      initialPage++;

      final response = await repository.getPopularMovies(page: initialPage);
      emit(SuccessState(movies: response));
      isLoading = false;
    } catch (e) {
      emit(ErrorState());
    }
  }
}