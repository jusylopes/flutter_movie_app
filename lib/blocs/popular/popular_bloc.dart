import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/blocs/popular/popular_event.dart';
import 'package:movie_app/blocs/popular/popular_state.dart';
import 'package:movie_app/models/popular_model.dart';
import 'package:movie_app/repositories/movie_repository.dart';

class PopularMovieBloc extends Bloc<PopularMovieEvent, PopularMovieState> {
  final MovieRepository _repository;
  int _currentPage = 1;
  bool isFetching = false;

  PopularMovieBloc({required MovieRepository<dynamic> repository})
      : _repository = repository,
        super(InitialState()) {
    on<PopularMovieFetchEvent>((event, emit) async {
      emit(LoadingState());
      isFetching = true;

      try {
        final List<MoviePopularModel> response =
            await _repository.getPopularMovies(page: _currentPage);

        isFetching = false;
        emit(SuccessState(popularMovies: response));
        _currentPage++;
      } catch (e) {
        isFetching = false;
        emit(ErrorState());
      }
    });
  }
}
