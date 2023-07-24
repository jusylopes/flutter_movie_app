import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/blocs/movie_detail/movie_detail_event.dart';
import 'package:movie_app/blocs/movie_detail/movie_detail_state.dart';
import 'package:movie_app/models/movie_detail_model.dart';
import 'package:movie_app/repositories/movie_repository.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final MovieRepository _repository;

  MovieDetailBloc({required MovieRepository<dynamic> repository})
      : _repository = repository,
        super(InitialState()) {
    on<MovieDetailFetchEvent>((event, emit) async {
      emit(LoadingState());

      try {
        final MovieDetailModel response =
            await _repository.getMovieDetail(id: event.id);

        emit(SuccessState(movie: response));
      } catch (e) {
        emit(ErrorState());
      }
    });
  }
}
