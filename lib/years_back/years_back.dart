import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/widgets/elevated_button.dart';

import '../constant.dart';
import '../features/movieFlow/MovieFlow/Movie_flow_controller.dart';
import '../result/result_screen.dart';

class YearsBackScreen extends ConsumerWidget {
  const YearsBackScreen({Key? key}) : super(key: key);

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
                Text(
                  '${ref.watch(movieFlowControllerProvider).yearsBack}',
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  ref.watch(movieFlowControllerProvider).yearsBack.toString(),
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                    color: Theme.of(context)
                        .textTheme
                        .headline4?.color
                        ?.withOpacity(0.62),
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
              label: '${ref.watch(movieFlowControllerProvider).yearsBack}',
              onChanged: (value) {
                ref.read(movieFlowControllerProvider.notifier)
                    .updateYearsBack(value.toInt());
              },
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButon(
                onPressed: () async {
                  debugPrint('button successful pressed');
                  await ref
                      .read(movieFlowControllerProvider.notifier)
                      .getRecommendedMovie();
                  debugPrint('recommended movie successful');
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultScreen()));
                },
                isLoading: ref.watch(movieFlowControllerProvider)
                    .movie
                    .when(
                  data: (_) => false,
                  loading: () => true,
                  error: (_, __) => false,
                ),
                text: 'Amazing',
              ),
            ),
            const SizedBox(height: kMediumSpacing),
          ],
        ),
      ),
    );
  }
}
