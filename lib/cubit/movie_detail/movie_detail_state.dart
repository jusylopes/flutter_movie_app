import 'package:equatable/equatable.dart';
import 'package:movie_app/models/movie_detail_model.dart';

abstract class MovieDetailState extends Equatable {}

class InitialState extends MovieDetailState {
  @override
  List<Object> get props => [];
}

class LoadingState extends MovieDetailState {
  @override
  List<Object> get props => [];
}

class SuccessState extends MovieDetailState {
  SuccessState(this.movies);
  final MovieDetailModel movies;

  @override
  List<Object> get props => [movies];
}

class ErrorState extends MovieDetailState {
  @override
  List<Object> get props => [];
}
