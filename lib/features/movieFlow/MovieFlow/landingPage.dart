import 'package:flutter/material.dart';
import 'package:movie/constant.dart';
class LandingPage extends StatefulWidget {
  const LandingPage({
    Key? key,
    required this.nextPage,
    required this.previousPage,
  }) : super(key: key);

  final VoidCallback nextPage;
  final VoidCallback previousPage;

  @override
  LandingPageState createState() => LandingPageState();
}

class LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(
              'Let\'s find a movie',
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height:  kMediumSpacing,),

            Image.asset('assets/horror.png'),
            SizedBox(height: kMediumSpacing,),

            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: widget.nextPage,
                child: const Text('Get Started'),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
