import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/blocs/trending/trendig_event.dart';
import 'package:movie_app/blocs/trending/trending_state.dart';
import 'package:movie_app/models/trending_model.dart';
import 'package:movie_app/repositories/movie_repository.dart';

class TrendingMovieBloc extends Bloc<TrendingMovieEvent, TrendingMovieState> {
  final MovieRepository _repository;

  TrendingMovieBloc({required MovieRepository<dynamic> repository})
      : _repository = repository,
        super(InitialState()) {
    on<TrendingMovieFetchEvent>((event, emit) async {
      emit(LoadingState());
      try {
        final List<MovieTrendingModel> response =
            await _repository.getTrendingMovies();
        emit(SuccessState(trendingMovies: response));
      } catch (e) {
        emit(ErrorState());
      }
    });
  }
}
