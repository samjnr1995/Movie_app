import 'dart:ffi';

import 'package:flutter/foundation.dart';

class MovieEntity {
  final String title;
  final String overview;
  final List<int> genresIds;
  final String releaseDate;
  final String? backDropPath;
  final String? posterPath;
  final num voteAverage;

  MovieEntity(
      {required this.title,
      required this.overview,
      required this.genresIds,
      required this.releaseDate,
      required this.voteAverage,
      this.backDropPath,
      this.posterPath});
  factory MovieEntity.fromMap(Map<String, dynamic> map) {
    return MovieEntity(
      title: map['title'],
      overview: map['overview'],
      genresIds: List<int>.from(map['genre_ids']),
      releaseDate: map['release_date'],
      voteAverage: map['vote_average'],
      backDropPath: map['backdrop_path'],
      posterPath: map['poster_path'],
    );
  }


  @override
  operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MovieEntity &&
        other.title == title &&
        other.overview == overview &&
        listEquals(other.genresIds, genresIds) &&
        other.releaseDate == releaseDate &&
        other.posterPath == posterPath;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        overview.hashCode ^
        genresIds.hashCode ^
        releaseDate.hashCode ^
        posterPath.hashCode;
  }

  @override
  String toString() {
    return 'MovieEntity(title: $title, overview: $overview, genresIds: $genresIds,, releaseDate: $releaseDate, posterPath $posterPath, backdropDate: $backDropPath';
  }
}
