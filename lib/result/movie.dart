import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../genre/genre.dart';

@immutable
class Movie {
  final String title;
  final String overView;
  final num voteAverage;
  final List<Genre> genres;
  final String releaseData;
  final String backDropPath;
  final String posterPath;

  const Movie({
    required this.title,
    required this.overView,
    required this.voteAverage,
    required this.genres,
    required this.releaseData,
    required this.backDropPath,
    required this.posterPath,
  });

  Movie.initial()
      : title = '',
        overView = '',
        voteAverage = 0,
        genres = [],
        releaseData = '',
        backDropPath = '',
        posterPath = '';

  String get getGenresCommaSeperated =>
      genres.map((e) => e.name).toList().join(',');

  @override
  String toString() {
    return 'Movie(title: $title, overview: $overView, voteAverage: $voteAverage, genres: $genres, releaseData: $releaseData, backDropPath: $backDropPath, posterPath: $posterPath)';
  }
  @override
  bool operator ==(Object other){
    if(identical (this, other)) return true;
    return other is  Movie &&
    other.title == title && other.overView == overView && other.voteAverage == voteAverage &&
    listEquals(other.genres, genres ) && other.releaseData == releaseData;
  }
  @override
  int get hashCode {
    return title.hashCode ^ overView.hashCode ^ voteAverage.hashCode ^ genres.hashCode ^ releaseData.hashCode;
  }
}
