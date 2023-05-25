import 'package:flutter/material.dart';
import 'package:movie/constant.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({
    Key? key,
    required this.nextPage,
    required this.previousPage,
  }) : super(key: key);

  final VoidCallback nextPage;
  final VoidCallback previousPage;

  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
   double rating = 5;
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
              'Select a minimum rating\nranging from 1 - 10',
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.center,
            ),
            Spacer(),
            Row(
              children: [
                Center(
                  child: Text(
                    '${rating.ceil()}',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                const Icon(
                  Icons.star_rounded,
                  color: Colors.amber,
                  size: 64,
                ),
              ],
            ),
            const Spacer(),
            Slider(
                value: rating,
                max: 10,
                min: 1,
                label: '${rating.ceil()}' ,
                onChanged: (value) {
                  setState(() {
                    rating = value;
                  });
                }),
            const Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: widget.nextPage,
                child: Text('yes please'),
              ),
            ),
            const SizedBox(height: kMediumSpacing,),
          ],
        ),
      ),
    );
  }
}
