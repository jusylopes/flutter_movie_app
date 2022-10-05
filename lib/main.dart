import 'package:flutter/material.dart';
import 'package:movie_app/utils/routes.dart';
import 'package:movie_app/utils/theme.dart';

void main() {
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: MovieTheme.dark,
      initialRoute: Routes.inicial,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
