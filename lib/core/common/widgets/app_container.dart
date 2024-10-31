import 'package:coin_pay/core/utils/color_res.dart';
import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  final double? width;

  final Widget child;
  const AppContainer({
    super.key,
    this.width,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorRes.lightGrey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      width: width,
      height: 55,
      child: child,
    );
  }
}
