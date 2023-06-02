import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/features/movieFlow/MovieFlow/landingPage.dart';

import '../../genre/genre_screen.dart';
import '../../rating/rating_screen.dart';
import '../../years_back/years_back.dart';
import 'MovieFlow/Movie_flow_controller.dart';

class MovieFlow extends ConsumerWidget {
  const MovieFlow({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageView(
      controller: ref.watch(movieFlowControllerProvider).pageController,
      physics: const NeverScrollableScrollPhysics(),
      children:  const [
        LandingPage(),
        GenreScreen(),
        RatingScreen(),
        YearsBackScreen(),
      ],
    );
  }
}
