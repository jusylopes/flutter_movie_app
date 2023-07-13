class MovieTrendingModel {
  final bool adult;
  final String backdropPath;
  final int id;
  final String title;
  final OriginalLanguage originalLanguage;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final MediaType mediaType;
  final List<int> genreIds;
  final double popularity;
  final DateTime releaseDate;
  final bool video;
  final double voteAverage;
  final int voteCount;

  MovieTrendingModel({
    required this.adult,
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.genreIds,
    required this.popularity,
    required this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieTrendingModel.fromJson(Map<String, dynamic> json) => MovieTrendingModel(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        id: json["id"],
        title: json["title"],
        originalLanguage:
            originalLanguageValues.map[json["original_language"]]!,
        originalTitle: json["original_title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        mediaType: mediaTypeValues.map[json["media_type"]]!,
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        popularity: json["popularity"]?.toDouble(),
        releaseDate: DateTime.parse(json["release_date"]),
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "id": id,
        "title": title,
        "original_language": originalLanguageValues.reverse[originalLanguage],
        "original_title": originalTitle,
        "overview": overview,
        "poster_path": posterPath,
        "media_type": mediaTypeValues.reverse[mediaType],
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "popularity": popularity,
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}

enum MediaType { MOVIE }

final mediaTypeValues = EnumValues({"movie": MediaType.MOVIE});

enum OriginalLanguage { EN, FI }

final originalLanguageValues =
    EnumValues({"en": OriginalLanguage.EN, "fi": OriginalLanguage.FI});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
