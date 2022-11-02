import 'package:flutter/material.dart';

import '../../core/constants/constants.dart';

class SampleStyleContainer extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final Color? color;
  const SampleStyleContainer({Key? key, required this.child, this.height, this.width, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: color?? MyColors.mainOuterColor.withOpacity(0.8),
        ),
        child: child,
    );
  }
}
