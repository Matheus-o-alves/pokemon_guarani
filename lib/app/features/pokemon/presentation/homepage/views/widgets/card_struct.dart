import 'package:flutter/material.dart';

import '../../../../../../utils/pokemon_type_colors.dart';

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
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.2),
        //     spreadRadius: 5,
        //     blurRadius: 7,
        //     offset: const Offset(0, 3),
        //   ),
        // ],
      ),
      child: child,
    );
  }
}
