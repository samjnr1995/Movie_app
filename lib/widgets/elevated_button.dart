import 'package:flutter/material.dart';
import '../constant.dart';

class ElevatedButon extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double width;

  ElevatedButon({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRadius / 2),
          ),
          fixedSize: Size(width, 48),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.button,
            ),
          ],
        ),
      ),
    );
  }
}
