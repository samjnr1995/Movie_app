import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/constant.dart';
import 'package:movie/result/movie.dart';

import '../features/movieFlow/MovieFlow/Movie_flow_controller.dart';

class ResultScreen extends ConsumerWidget {
final double movieHeight = 150;

  const ResultScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
              child: ListView(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  const CoverImage(),
                  Positioned(
                    width: MediaQuery.of(context).size.width,
                    bottom: -(movieHeight / 2),
                    child: MovieImageDetails(
                       movie: ref.watch(movieFlowControllerProvider).movie, movieHeight: movieHeight,),
                  ),
                ],
              ),
              SizedBox(
                height: movieHeight / 2,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  ref.watch(movieFlowControllerProvider).movie.overView,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            ],
          )),
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
  }
}

class CoverImage extends StatefulWidget {
  const CoverImage({super.key});

  @override
  _CoverImageState createState() => _CoverImageState();
}

class _CoverImageState extends State<CoverImage> {
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
        child: const Placeholder(),
      ),
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
            child: const Placeholder(),
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
