import 'package:flutter/material.dart';
import 'package:movie_app/screens/trending/trending_movie_screen.dart';
import 'package:movie_app/screens/popular/popular_screen.dart';
import 'package:movie_app/utils/strings.dart';

class HomeSreen extends StatelessWidget {
  const HomeSreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            height: 40,
            color: Theme.of(context).primaryColor,
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              MovieStrings.appName,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          bottom: TabBar(
              labelStyle: Theme.of(context).textTheme.titleSmall,
              labelColor: Theme.of(context).primaryColor,
              unselectedLabelColor: Colors.grey,
              tabs: const [
                Tab(child: Text('Popular')),
                Tab(child: Text('Trending'))
              ]),
        ),
        body: const TabBarView(children: [
          PopularMovieScreen(),
          TrendingMovieScreen(),
        ]),
      ),
    );
  }
}
