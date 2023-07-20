import 'package:flutter/material.dart';
import 'package:movie_app/screens/movie_detail/movie_detail_screen.dart';
import 'package:movie_app/utils/strings.dart';

class GridViewMovie extends StatefulWidget {
  const GridViewMovie({super.key, required this.movie, this.scrollController});

  final ScrollController? scrollController;
  final List movie;

  @override
  State<GridViewMovie> createState() => _GridViewMovieState();
}

class _GridViewMovieState extends State<GridViewMovie> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scrollbar(
      controller: scrollController,
      child: GridView.builder(
        padding: const EdgeInsets.all(15),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            crossAxisCount: screenWidth ~/ 130,
            childAspectRatio: 9 / 18),
        itemCount: widget.movie.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    MovieDetailScreen(movieId: widget.movie[index].id),
              ),
            );
          },
          child: GridTile(
            header: Image.network(
              MovieStrings.urlImagePoster + widget.movie[index].posterPath,
              fit: BoxFit.cover,
            ),
            footer: Text(
              widget.movie[index].title,
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
    scrollController.dispose();
    super.dispose();
  }
}
