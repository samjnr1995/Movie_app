import 'package:flutter/material.dart';

import '../constant.dart';
import 'genre.dart';

class ListCard extends StatefulWidget {
  const ListCard({
    Key? key,
    required this.onTap,
    required this.genre,
  }) : super(key: key);

  final VoidCallback onTap;
  final Genre genre;

  @override
  _ListCardState createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {


  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Material(
        color: widget.genre.isSelected? Theme.of(context).colorScheme.primary : Colors.transparent,
        borderRadius: BorderRadius.circular(kBorderRadius),
        child: InkWell(
          borderRadius: BorderRadius.circular(kBorderRadius),
          onTap: widget.onTap,
          child: Container(
            width: 140,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(widget.genre.name, textAlign: TextAlign.center,),

          ),
        ),
      ),
    );
  } }