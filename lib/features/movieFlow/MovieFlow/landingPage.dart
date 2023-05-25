import 'package:flutter/material.dart';
import 'package:movie/widgets/elevated_button.dart';
class LandingPage extends StatefulWidget {
  const LandingPage({
    Key? key,
    required this.nextPage,
    required this.previousPage,
  }) : super(key: key);

  final VoidCallback nextPage;
  final VoidCallback previousPage;

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
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

            Image.asset('assets/horror.png'),

            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: widget.nextPage,
                child: Text('Get Started'),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
