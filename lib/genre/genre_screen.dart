import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/core/failue.dart';
import 'package:movie/widgets/elevated_button.dart';

import '../constant.dart';
import '../core/failure_screen.dart';
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
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.center,
                  ),
                  Expanded(
                    child: ref.watch(movieFlowControllerProvider).genres.when(data: (genres){
                     return  ListView.separated(
                        padding: const EdgeInsets.symmetric(vertical: kListItemSpacing),
                        itemBuilder: (context, index) {
                          final genre = genres[index];
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
                        genres.length,
                      );


                    }, error: (e, s){
                     if (e is Failure){
                       return FailureBody(message:  e.message ?? ' Unknown error occurred');
                     }
                     return const FailureBody(message: 'Something went wrong from our end');
                    }, loading: () => const Center(
                      child:  CircularProgressIndicator(),
                    ))
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 50),
          ElevatedButon(onPressed: () {
            ref.read(movieFlowControllerProvider.notifier).nextPage();
          }, text: 'Continue',)
        ],
      ),
    );
  }
}
