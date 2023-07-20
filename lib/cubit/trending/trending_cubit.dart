import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/trending/trending_state.dart';
import 'package:movie_app/repositories/movie_repository.dart';

class TrendingMovieCubit extends Cubit<TrendingMovieState> {
  TrendingMovieCubit({required this.repository}) : super(InitialState()) {
    getTrendingMovies();
  }

  final MovieRepository repository;

  void getTrendingMovies() async {
    try {
      emit(LoadingState());
      final response = await repository.getTrendingMovies();
      emit(SuccessState(trendingMovies: response));
    } catch (e) {
      emit(ErrorState());
    }
  }
}
