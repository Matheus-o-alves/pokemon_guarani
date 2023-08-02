import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/homepage_controller.dart';
import 'choice_tip_bar.dart';

// ignore: must_be_immutable
class HeaderHomePage extends StatelessWidget {
  Widget child;
  HeaderHomePage({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<HomePageController>(
          id: 'filter',
          builder: (_) {
            return ChoiceTipBar(controller: _);
          },
        ),
        Expanded(child: child),
      ],
    );
  }
}
