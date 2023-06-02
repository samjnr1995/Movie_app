import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constant.dart';
import '../features/movieFlow/MovieFlow/Movie_flow_controller.dart';

class YearsBackScreen extends ConsumerWidget {
  const YearsBackScreen({
    Key? key,

  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: (){
            ref.watch(movieFlowControllerProvider.notifier).previousPage();
          }
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'How many years should we check for?',
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.center,
            ),
            const Spacer(),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${ref.watch(movieFlowControllerProvider).yearsBack}',style: Theme.of(context).textTheme.headline5,),
                Text(
                  'Years back',
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                    color: Theme.of(context).textTheme.headline4?.color?.withOpacity(0.62),
                  ),
                ),

              ],
            ),
            const Spacer(),
            Slider(
                value: ref.watch(movieFlowControllerProvider).yearsBack.toDouble(),
                max: 70,
                min: 0,
                divisions: 70,
                label:
                '${ref.watch(movieFlowControllerProvider).yearsBack}' ,
                onChanged: (value) {
                  ref.read(movieFlowControllerProvider.notifier).updateYearsBack(value.toInt());
                }),
            const Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () => ref.read(movieFlowControllerProvider.notifier).nextPage(),
                child: const Text('yes please'),
              ),
            ),
            const SizedBox(height: kMediumSpacing,),
          ],


        ),

      ),
    );

  }}