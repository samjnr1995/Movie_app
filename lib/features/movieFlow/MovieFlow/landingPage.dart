import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/constant.dart';
import 'package:movie/widgets/elevated_button.dart';

import 'Movie_flow_controller.dart';

class LandingPage extends ConsumerWidget {
  const LandingPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(
              'Let\'s find a movie',
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: kMediumSpacing,
            ),
            const CircleAvatar(
                radius: 100, backgroundImage: AssetImage('assets/horror.png')),
            const SizedBox(
              height: kMediumSpacing,
            ),
            ElevatedButon(
                onPressed:
                    ref.read(movieFlowControllerProvider.notifier).nextPage,
                text: 'Get Started'),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
