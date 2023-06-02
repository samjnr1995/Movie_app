import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/features/movieFlow/MovieFlow/movie_flow_state.dart';

import '../../../genre/genre.dart';

final movieFlowControllerProvider =
    StateNotifierProvider.autoDispose<MovieFlowController, MovieFlowState>(
        (ref) => MovieFlowController(MovieFlowState(pageController: PageController())));

class MovieFlowController extends StateNotifier<MovieFlowState> {
  MovieFlowController(MovieFlowState state) : super(state);

  void toggleSelected(Genre genre) {
    state = state.copyWith(
genres:  [
  for (final oldGenres in state.genres)
    if (oldGenres == genre) oldGenres.toggleSelected() else oldGenres
]
    );
  }

  void updateRating(int updatedRating){
    state = state.copyWith(rating:  updatedRating);
  }

  void updateYearsBack(int updatedYearsBack){
    state = state.copyWith(yearsBack:  updatedYearsBack);
  }
  void nextPage() {
    if (state.pageController.page! > 1){
      if (!state.genres.any((element) => element.isSelected == true)) {
        return;
      }
    }
    state.pageController.nextPage(duration: const Duration(milliseconds:  600), curve: Curves.easeOutCubic);
  }

  void previousPage () {
    state.pageController.previousPage(duration: const Duration(milliseconds: 600), curve: Curves.easeOutCubic);
  }
  @override
  void dispose() {
    state.pageController.dispose();
    super.dispose();
  }
}
