import 'package:flutter/material.dart';
import 'package:movie/constant.dart';
import 'package:movie/genre/genre.dart';
import 'package:movie/result/movie.dart';

class ResultScreen extends StatefulWidget {
  static route({bool fullscreenDialog = true}) =>
      MaterialPageRoute(builder: (context) => ResultScreen());
  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  final double movieHeight = 150;
  final movie = const Movie(
      title: 'The Hulk',
      overView: 'Samuel, a genetics researcher with a huge past',
      voteAverage: 4.8,
      genres: [
        Genre(name: 'Action'),
        Genre(name: 'Fantasy'),
      ],
      releaseData: '2019 - 05 - 15',
      backDropPath: '',
      posterPath: '');
  @override
  Widget build(BuildContext context) {
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
                  CoverImage(),
                  Positioned(
                    width: MediaQuery.of(context).size.width,
                    bottom: -(movieHeight / 2),
                    child: MovieImageDetails(
                        movie: movie, movieHeight: movieHeight),
                  ),
                ],
              ),
              SizedBox(
                height: movieHeight / 2,
              ),
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  movie.overView,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            ],
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Find another movie'),
            ),
          ),
        ],
      ),
    );
  }
}

class CoverImage extends StatefulWidget {
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

class MovieImageDetails extends StatelessWidget {
  const MovieImageDetails(
      {Key? key, required this.movie, required this.movieHeight})
      : super(key: key);
  final Movie movie;
  final double movieHeight;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            height: movieHeight,
            child: const Placeholder(),
          ),
          SizedBox(
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
                    '4.8',
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        color: Theme.of(context)
                            .textTheme
                            .bodyText2
                            ?.color
                            ?.withOpacity(0.62)),
                  ),
                  Icon(
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
