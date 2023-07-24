import 'package:equatable/equatable.dart';

abstract class TrendingMovieEvent extends Equatable {
  const TrendingMovieEvent();
}

class TrendingMovieFetchEvent extends TrendingMovieEvent {
  @override
  List<Object> get props => [];
}