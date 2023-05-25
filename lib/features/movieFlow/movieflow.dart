import 'package:flutter/material.dart';
import 'package:movie/features/movieFlow/MovieFlow/landingPage.dart';

import '../../genre/genre_screen.dart';
import '../../rating/rating_screen.dart';
import '../../years_back/years_back.dart';

class MovieFlow extends StatefulWidget {
  const MovieFlow({Key? key}) : super(key: key);

  @override
  _MovieFlowState createState() => _MovieFlowState();
}

class _MovieFlowState extends State<MovieFlow> {
  final pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void nextPage() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 600), curve: Curves.easeOutCubic);
  }
  void previousPage() {
    pageController.previousPage(
        duration: const Duration(milliseconds: 600), curve: Curves.easeOutCubic);
  }
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        LandingPage(nextPage: nextPage, previousPage: previousPage),
        GenreScreen(nextPage: nextPage, previousPage: previousPage),
        RatingScreen(nextPage: nextPage, previousPage: previousPage),
        YearsBackScreen(nextPage: nextPage, previousPage: previousPage)
      ],
    );
  }
}
