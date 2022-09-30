import 'package:flutter/material.dart';
import 'package:movie_app/models/popular_movie_model.dart';

class GridViewMovie extends StatelessWidget {
  const GridViewMovie(
      {super.key,
      required this.maxWidth,
      required this.maxHeight,
      required this.scrollController,
      required this.movie});
  final double maxWidth;
  final double maxHeight;
  final ScrollController scrollController;
  final List<PopularMovieModel> movie;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: GridView.builder(
        padding: const EdgeInsets.all(15),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            crossAxisCount: maxWidth ~/ 130,
            childAspectRatio: 9 / 18),
        controller: scrollController,
        itemCount: movie.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            print(movie[index].title);
          },
          child: GridTile(
            header: Image.network(
              'https://image.tmdb.org/t/p/w220_and_h330_face${movie[index].posterPath}',
              fit: BoxFit.cover,
            ),
            footer: Text(
              movie[index].title,
              style: Theme.of(context).textTheme.bodyText1,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            child: const SizedBox(),
          ),
        ),
      ),
    );
  }
}
