import 'package:dio/dio.dart';
import 'package:movie_app/models/movie_detail_model.dart';
import 'package:movie_app/models/movie_popular_model.dart';
import 'package:movie_app/models/movie_trending_model.dart';

import 'package:movie_app/services/api_base_options.dart';
import 'package:movie_app/utils/strings.dart';

class MovieRepository {
  final Dio _dio = Dio(dioOptions);

  Future<List<MoviePopularModel>> getPopularMovies({required int page}) async {
    try {
      Response response = await _dio.get('https://api.themoviedb.org/3/movie/popular?api_key=${MovieStrings.apiKey}');
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

  Future<MovieDetailModel> getMovieDetail({required int id}) async {
    try {
      Response response = await _dio.get('${MovieStrings.endpointMovieDetail}$id');
      return MovieDetailModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<MovieTrendingModel>> getTrendingMovies() async {
    try {
      Response response = await _dio.get(MovieStrings.endpointTrendingMovies);
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
}
