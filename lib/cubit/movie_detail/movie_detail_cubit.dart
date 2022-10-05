import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/movie_detail/movie_detail_state.dart';
import 'package:movie_app/services/movie_repository.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  MovieDetailCubit({required this.repository}) : super(InitialState());

  final MovieRepository repository;

  void getMovieDetail({required int id}) async {
    try {
      emit(LoadingState());
      print('loading');
      print(id);
      final response = await repository.getMovieDetail(id: id);

      print(response);

      emit(SuccessState(response));
      print('sucess');
    } catch (e) {
      emit(ErrorState());
      print('error');
    }
  }
}
