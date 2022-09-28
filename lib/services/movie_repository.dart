import 'package:dio/dio.dart';
import 'package:movie_app/models/movie_detail_model.dart';
import 'package:movie_app/models/popular_movie_model.dart';
import 'package:movie_app/services/api_base_options.dart';

class MovieRepository {
  final Dio _dio = Dio(dioOptions);

  Future<List<PopularMovieModel>> getPopularMovies({required int page}) async {
    try {
      Response response = await _dio.get('/movie/popular?page=$page');
      final data = response.data;
      List<PopularMovieModel> movies = data['results']
          .map<PopularMovieModel>(
              (movies) => PopularMovieModel.fromJson(movies))
          .toList();

      print(response.data);
      return movies;
    } catch (e) {
      rethrow;
    }
  }

  Future<MovieDetailModel> getMovieDetail(int id) async {
    try {
      Response response = await _dio.get(
        '/movie/$id',
      );
      return MovieDetailModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
