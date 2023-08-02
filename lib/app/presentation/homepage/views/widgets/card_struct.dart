import 'package:flutter/material.dart';

class CardStruct extends StatelessWidget {
  Widget child;
  Color color;
  CardStruct({Key? key, required this.child, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(32),
      ),
      child: child,
    );
  }
}
