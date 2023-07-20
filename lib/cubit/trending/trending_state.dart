import 'package:equatable/equatable.dart';
import 'package:movie_app/models/trending_model.dart';

abstract class TrendingMovieState extends Equatable {}

class InitialState extends TrendingMovieState {
  @override
  List<Object> get props => [];
}

class LoadingState extends TrendingMovieState {
  @override
  List<Object> get props => [];
}

class SuccessState extends TrendingMovieState {
  SuccessState({required this.trendingMovies});
  final List<MovieTrendingModel> trendingMovies;

  @override
  List<Object> get props => [trendingMovies];
}

class ErrorState extends TrendingMovieState {
  @override
  List<Object> get props => [];
}
