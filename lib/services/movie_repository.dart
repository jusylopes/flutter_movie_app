import 'package:dio/dio.dart';
import 'package:movie_app/models/movie_detail_model.dart';
import 'package:movie_app/models/popular_movie_model.dart';
import 'package:movie_app/services/api_base_options.dart';

class MovieRepository {
  final Dio _dio = Dio(dioOptions);

  Future<PopularMovieModel> getPopularMovies() async {
    try {
      Response response = await _dio.get('/movie/popular');
      final data = PopularMovieModel.fromJson(response.data);

      print(response.data);
      return data;
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
