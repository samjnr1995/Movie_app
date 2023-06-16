import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/genre/genre_entity.dart';
import 'package:movie/main.dart';
import 'package:movie/result/movie.dart';
import 'package:movie/result/movie_entity.dart';

import '../core/3nvironmental_variable.dart';

final movieRepositoryProvider = Provider<MovieRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return TMDBMovieRepository(dio: dio);
});

abstract class MovieRepository {
  Future<List<GenreEntity>> getMoviesGenre();
  Future<List<MovieEntity>> getRecommendedMovies(
      double rating, String date, String genresIds);
}

class TMDBMovieRepository implements MovieRepository {
  TMDBMovieRepository({required this.dio});
  final Dio dio;

  @override
  Future<List<GenreEntity>> getMoviesGenre() async {
    final response = await dio.get('genre/movie/list', queryParameters: {
      'api_key': api,
      'language': 'en-US',
    });
    final result = List<Map<String, dynamic>>.from(response.data['genres']);
    final genres = result.map((e) => GenreEntity.fromMap(e)).toList();
    return genres;
  }

  @override
  Future<List<MovieEntity>> getRecommendedMovies(
      double rating, String date, String genresIds) async {
    final response = await dio.get('discover/movie', queryParameters: {
      'api_key': api,
      'language': 'en-US',
      'sort_by': 'popularity.desc',
      'include_adult': false,
      'vote_average.gte': rating,
      'page': 1,
      'release_date.gte': date,
      'with_genres': genresIds,
    });
    final results = List<Map<String, dynamic>>.from(response.data['results']);
    final movies = results.map((e) => MovieEntity.fromMap(e)).toList();
    return movies;
  }
}
