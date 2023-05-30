import 'package:flutter/material.dart';
import 'package:movie/result/result_screen.dart';

import '../constant.dart';

class YearsBackScreen extends StatefulWidget {
  const YearsBackScreen({
    Key? key,
    required this.nextPage,
    required this.previousPage,
  }) : super(key: key);

  final VoidCallback nextPage;
  final VoidCallback previousPage;

  @override
  _YearsBackScreenState createState() => _YearsBackScreenState();
}

class _YearsBackScreenState extends State<YearsBackScreen> {
  double yearsBack = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: widget.previousPage,
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
            Spacer(),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${yearsBack.ceil()}',style: Theme.of(context).textTheme.headline5,),
                Text(
                  'Years back',
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                    color: Theme.of(context).textTheme.headline4?.color?.withOpacity(0.62),
                  ),
                ),

              ],
            ),
            Spacer(),
            Slider(
                value: yearsBack,
                max: 70,
                min: 0,
                divisions: 70,
                label:
                '${yearsBack.ceil()}' ,
                onChanged: (value) {
                  setState(() {
                    yearsBack = value;
                  });
                }),
            const Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).push(ResultScreen.route()),
                child: Text('yes please'),
              ),
            ),
            const SizedBox(height: kMediumSpacing,),
          ],


        ),

      ),
    );

  }}