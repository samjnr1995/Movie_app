import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../genre/genre.dart';
import '../../../result/movie.dart';
import '../../../result/movie_repository.dart';

final movieServiceProvider = Provider<MovieService>((ref) {
  final movieRepository = ref.watch(movieRepositoryProvider);
  return TMDBMovieService(movieRepository);
});

abstract class MovieService {
  Future<List<Genre>> getGenres();
  Future<Movie> getRecommendedMovies(
      int rating,
      int yearsBack,
      List<Genre> genres,
      [DateTime? yearsBackFromDate]
      );
}

class TMDBMovieService implements MovieService {
  TMDBMovieService(this._movieRepository);

  final MovieRepository _movieRepository;

  @override
  Future<List<Genre>> getGenres() async {
    final genresEntities = await _movieRepository.getMoviesGenre();
    final genres = genresEntities.map((e) => Genre.fromEntity(e)).toList();
    return genres;
  }

  @override
  Future<Movie> getRecommendedMovies(int rating, int yearsBack,
      List<Genre> genres, [DateTime? yearsBackFromDate]) async {

      final date = yearsBackFromDate ?? DateTime.now();
      final year = date.year - yearsBack;
      final genresIds = genres.map((e) => e.id).toList().join(',');
      final movieEntities = await _movieRepository.getRecommendedMovies(
        rating.toDouble(),
        '$year-01-01',
        genresIds,
      );
      final movies = movieEntities.map((e) => Movie.fromEntity(e, genres))
          .toList();
      final rnd = Random();
      final randomMovie = movies[rnd.nextInt(movies.length)];
      return randomMovie;
    }
  }
