import 'package:coin_pay/core/utils/color_res.dart';
import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  final double? width;
  final double height;
  final double borderRadius;
  final double borderWidth;
  final Color borderColor;
  final Color containerColor;


  final Widget child;
  const AppContainer({
    super.key,
    this.width,
  
    required this.child,
    this.borderColor = ColorRes.lightGrey,
    this.containerColor = Colors.transparent,
    this.height = 55,
    this.borderRadius = 10,
    this.borderWidth = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
     
      decoration: BoxDecoration(
        color: containerColor,
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      width: width,
      height: height,
      child: child,
    );
  }
}
