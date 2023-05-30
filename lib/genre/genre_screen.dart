import 'package:flutter/material.dart';

import '../constant.dart';
import 'genre.dart';
import 'list_card.dart';

class GenreScreen extends StatefulWidget {
  const GenreScreen({
    Key? key,
    required this.nextPage,
    required this.previousPage,
  }) : super(key: key);

  final VoidCallback nextPage;
  final VoidCallback previousPage;

  @override
  GenreScreenState createState() => GenreScreenState();
}

class GenreScreenState extends State<GenreScreen> {
  List<Genre> genres = [
    const Genre(name: 'Action'),
    const Genre(name: 'Comedy'),
    const Genre(name: 'Horror'),
    const Genre(name: 'Anime'),
    const Genre(name: 'Drama'),
    const Genre(name: 'Family'),
    const Genre(name: 'Romance'),
  ];

  void toggleSelected(Genre genre) {
    List<Genre> updatedGenres = [
      for (final oldGenre in genres)
        if (oldGenre == genre)
          oldGenre.toggleSelected()
        else
          oldGenre
    ];
    setState(() {
      genres = updatedGenres;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: widget.previousPage,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Let\'s start with a genre',
                    style: Theme.of(context).textTheme.headline5,
                    textAlign: TextAlign.center,
                  ),
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(vertical: 60),
                      itemBuilder: (context, index) {
                        final genre = genres[index];
                        return ListCard(
                          genre: genre,
                          onTap: () => toggleSelected(genre),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: kListItemSpacing);
                      },
                      itemCount: genres.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 50),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: widget.nextPage,
              child: const Text('Continue'),
            ),
          ),
        ],
      ),
    );
  }
}
