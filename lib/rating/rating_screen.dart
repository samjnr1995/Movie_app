import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/constant.dart';
import 'package:movie/widgets/elevated_button.dart';

import '../features/movieFlow/MovieFlow/Movie_flow_controller.dart';

class RatingScreen extends ConsumerWidget {
  const RatingScreen({
    Key? key,
  }) : super(key: key);

  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: (){
            ref.read(movieFlowControllerProvider.notifier).previousPage();
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Select a minimum rating\nranging from 1 - 10',
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Center(
              child: Row(
                children: [
                  Center(
                    child: Text(
                      '${ref.watch(movieFlowControllerProvider).rating}',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  Center(
                    child: const Icon(
                      Icons.star_rounded,
                      color: Colors.amber,
                      size: 64,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Slider(
                value: ref.watch(movieFlowControllerProvider).rating.toDouble(),
                max: 10,
                min: 1,
                label: '${ref.watch(movieFlowControllerProvider).rating}' ,
                onChanged: (value) {
                  ref.read(movieFlowControllerProvider.notifier).updateRating(value.toInt());
                }),
            const Spacer(),
            ElevatedButon(onPressed: ref.read(movieFlowControllerProvider.notifier).nextPage, text: 'Proceed'),
            const SizedBox(height: kMediumSpacing,),
          ],
        ),
      ),
    );
  }
}
