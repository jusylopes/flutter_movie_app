import 'package:flutter/material.dart';
import 'package:movie_app/screens/movie_detail/movie_detail_screen.dart';
import 'package:movie_app/utils/strings.dart';

class MovieGridView extends StatefulWidget {
  const MovieGridView({super.key, required List<dynamic> movie, ScrollController? scrollController}) : _scrollController = scrollController, _movie = movie;

  final ScrollController? _scrollController;
  final List _movie;

  @override
  State<MovieGridView> createState() => _MovieGridViewState();
}

class _MovieGridViewState extends State<MovieGridView> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scrollbar(
      controller: widget._scrollController,
      child: GridView.builder(
        padding: const EdgeInsets.all(15),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            crossAxisCount: screenWidth ~/ 130,
            childAspectRatio: 9 / 18),
        itemCount: widget._movie.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    MovieDetailScreen(movieId: widget._movie[index].id),
              ),
            );
          },
          child: GridTile(
            header: Image.network(
              MovieStrings.urlImagePoster + widget._movie[index].posterPath,
              fit: BoxFit.cover,
            ),
            footer: Text(
              widget._movie[index].title,
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            child: const SizedBox(),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    widget._scrollController?.dispose();
    super.dispose();
  }
}
