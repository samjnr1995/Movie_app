import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/constant.dart';
import 'package:movie/core/failue.dart';
import 'package:movie/result/movie.dart';

import '../core/failure_screen.dart';
import '../features/movieFlow/MovieFlow/Movie_flow_controller.dart';

class ResultScreen extends ConsumerWidget {
  static route({fullScreenDialogue = true}) => MaterialPageRoute(
        builder: (context) => const ResultScreen(),
        fullscreenDialog: fullScreenDialogue,
      );
  final double movieHeight = 150;

  const ResultScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(movieFlowControllerProvider).movie.when(
        data: (movie) {
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Expanded(
                    child: ListView(children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CoverImage(
                        movie: movie,
                      ),
                      Positioned(
                        width: MediaQuery.of(context).size.width,
                        bottom: -(movieHeight / 2),
                        child: MovieImageDetails(
                          movie: movie,
                          movieHeight: movieHeight,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: movieHeight / 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      movie.overView,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ])),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Find another movie'),
                  ),
                ),
              ],
            ),
          );
        },
        error: (e, s, ) {
          if(e is Failure){
            return FailureScreen(message:  e.message ?? 'Unknown error occurred');
          }
          return const FailureScreen(message: 'Something went wrong on our end');
        },
        loading: () => const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ));
  }
}

class CoverImage extends StatelessWidget {
  const CoverImage({Key? key, required this.movie}) : super(key: key);
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 298),
      child: ShaderMask(
          shaderCallback: (rect) {
            return LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).scaffoldBackgroundColor,
                Colors.transparent
              ],
            ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
          },
          blendMode: BlendMode.dstIn,
          child: Image.network(
            movie.backDropPath?? '',
            fit: BoxFit.cover,
            errorBuilder: (context, e, s) {
              return const SizedBox();
            },
          )),
    );
  }
}

class MovieImageDetails extends ConsumerWidget {
  const MovieImageDetails(
      {Key? key, required this.movie, required this.movieHeight})
      : super(key: key);
  final Movie movie;
  final double movieHeight;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            height: movieHeight,
            child: Image.network(movie.posterPath?? '', fit: BoxFit.cover,
                errorBuilder: (context, e, s) {
              return const SizedBox();
            }),
          ),
          const SizedBox(
            width: kMediumSpacing,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title,
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                movie.getGenresCommaSeperated,
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Row(
                children: [
                  Text(
                    movie.voteAverage.toString(),
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        color: Theme.of(context)
                            .textTheme
                            .bodyText2
                            ?.color
                            ?.withOpacity(0.62)),
                  ),
                  const Icon(
                    Icons.star_rounded,
                    size: 20,
                    color: Colors.amber,
                  ),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
