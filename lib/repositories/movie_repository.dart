import 'package:dio/dio.dart';
import 'package:movie_app/models/movie_detail_model.dart';
import 'package:movie_app/models/popular_model.dart';
import 'package:movie_app/models/trending_model.dart';
import 'package:movie_app/repositories/api_base_options.dart';

class MovieRepository<T> {
  final Dio _dio = Dio(dioOptions);

  Future<List<MoviePopularModel>> getPopularMovies({required int page}) async {
    try {
      Response response = await _dio.get('$endpointPopularMovies$page');

      final data = response.data;
      List<MoviePopularModel> movies = data['results']
          .map<MoviePopularModel>(
              (movies) => MoviePopularModel.fromJson(movies))
          .toList();

      return movies;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<MovieTrendingModel>> getTrendingMovies() async {
    try {
      Response response = await _dio.get(endpointTrendingMovies);
      final data = response.data;
      List<MovieTrendingModel> trendingMovies = data['results']
          .map<MovieTrendingModel>(
              (movies) => MovieTrendingModel.fromJson(movies))
          .toList();

      return trendingMovies;
    } catch (e) {
      rethrow;
    }
  }

  Future<MovieDetailModel> getMovieDetail({required int id}) async {
    try {
      Response response = await _dio.get('$endpointMovieDetail$id');
      return MovieDetailModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
