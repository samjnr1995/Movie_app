
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/features/movieFlow/MovieFlow/movie_flow_state.dart';
import 'package:movie/features/movieFlow/MovieFlow/service.dart';

import '../../../genre/genre.dart';
import '../../../result/movie.dart';

final movieFlowControllerProvider =
    StateNotifierProvider.autoDispose<MovieFlowController, MovieFlowState>(
        (ref) => MovieFlowController(
            MovieFlowState(
              pageController: PageController(),
              movie: AsyncValue.data(Movie.initial()),
              genres: const AsyncValue.data([]),
            ),
            ref.watch(movieServiceProvider)));

class MovieFlowController extends StateNotifier<MovieFlowState> {
  MovieFlowController(MovieFlowState state, this._movieService) : super(state) {
    loadGenres();
  }

  final MovieService _movieService;
  Future<void> loadGenres() async {
    state = state.copyWith(genres: const AsyncValue.loading());
    final results = await _movieService.getGenres();
    state = state.copyWith(genres: AsyncValue.data(results));
  }

  Future<void> getRecommendedMovie() async {
    state = state.copyWith(movie: const AsyncValue.loading());

    final selectedGenres = state.genres.asData?.value.where((element) => element.isSelected).toList(growable: false) ?? [];


    final result = await _movieService.getRecommendedMovies(
          state.rating, state.yearsBack, selectedGenres);

      state = state.copyWith(movie: AsyncValue.data(result));

  }

  void toggleSelected(Genre genre) {
    state = state.copyWith(
      genres: AsyncValue.data([
        for (final oldGenre in state.genres.asData!.value)
          if (oldGenre == genre) oldGenre.toggleSelected() else oldGenre
      ]),
    );
  }


  void updateRating(int updatedRating) {
    state = state.copyWith(rating: updatedRating);
  }

  void updateYearsBack(int updatedYearsBack) {
    state = state.copyWith(yearsBack: updatedYearsBack);
  }

  void nextPage() {
    if (state.pageController.page! > 1) {
      if (!state.genres.asData!.value.any((e) => e.isSelected == true)){
        return;
      }
    }
    state.pageController.nextPage(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutCubic,
    );
  }

  void previousPage() {
    state.pageController.previousPage(
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeOutCubic);
  }

  @override
  void dispose() {
    state.pageController.dispose();
    super.dispose();
  }
}
