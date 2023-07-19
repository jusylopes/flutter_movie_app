import 'package:dio/dio.dart';

const badeUrlApi = 'https://api.themoviedb.org/3';
const apikey = 'apikey';
const String endpointPopularMovies = '/movie/popular?page=';
const String endpointMovieDetail = '/movie/';
const String endpointTrendingMovies = '/trending/movie/day?';

final dioOptions = BaseOptions(
    baseUrl: badeUrlApi,
    connectTimeout: 5000,
    receiveTimeout: 3000,
    contentType: 'application/json;charset=utf-8',
    queryParameters: {'api_key': apikey});
