import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/movie_detail/movie_detail_state.dart';
import 'package:movie_app/services/movie_repository.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  MovieDetailCubit({required this.repository}) : super(InitialState());

  final MovieRepository repository;

  void loadMovieDetail(int id) async {
    try {
      emit(LoadingState());

      final movieDetailResponse = await repository.getMovieDetail(id);

      emit(SuccessState(movieDetailResponse));
    } catch (e) {
      emit(ErrorState());
    }
  }
}
