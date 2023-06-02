import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constant.dart';
import '../features/movieFlow/MovieFlow/Movie_flow_controller.dart';
import 'list_card.dart';

class GenreScreen extends ConsumerWidget {
  const GenreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            ref.read(movieFlowControllerProvider.notifier).previousPage();
          },
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
                        final genre = ref
                            .watch(movieFlowControllerProvider)
                            .genres[index];
                        return ListCard(
                          genre: genre,
                          onTap: () => ref
                              .read(movieFlowControllerProvider.notifier)
                              .toggleSelected(genre),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: kListItemSpacing);
                      },
                      itemCount:
                          ref.watch(movieFlowControllerProvider).genres.length,
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
              onPressed: () {
                ref.read(movieFlowControllerProvider.notifier).nextPage();
              },
              child: const Text('Continue'),
            ),
          ),
        ],
      ),
    );
  }
}
