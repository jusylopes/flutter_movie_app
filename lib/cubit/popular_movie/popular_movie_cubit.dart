import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/popular_movie/popular_movie_state.dart';
import 'package:movie_app/services/movie_repository.dart';

class PopularMovieCubit extends Cubit<PopularMovieState> {
  PopularMovieCubit({required this.repository}) : super(InitialState()) {
    getPopularMovies();
  }

  final MovieRepository repository;
  int _initialPage = 0;
  bool isLoading = true;

  void getPopularMovies() async {
    try {
      if (isLoading) {
        emit(LoadingState());
         print('loading');
      }
      _initialPage++;
      final response = await repository.getPopularMovies(page: _initialPage);
      print('success');
      emit(SuccessState(popularMovies: response));
    } catch (e) {
      emit(ErrorState());
    }
  }
}
