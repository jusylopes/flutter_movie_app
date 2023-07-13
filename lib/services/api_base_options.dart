import 'package:dio/dio.dart';
import 'package:movie_app/utils/strings.dart';

final dioOptions = BaseOptions(
  baseUrl: 'https://api.themoviedb.org/3',
  connectTimeout: 5000,
  receiveTimeout: 3000,
  queryParameters: {'apiKey': MovieStrings.apiKey},
  contentType: 'application/json;charset=utf-8',
  headers: {'Authorization': 'Bearer ${MovieStrings.apiKey}'},
);
