import 'package:coin_pay/core/utils/color_res.dart';
import 'package:flutter/material.dart';

/// THE BUTTON USED ALMOST ALL THRORUGH THE APP

Widget generalButton({
  int? index,
  void Function()? onTap,
  double? height,
  required Widget child,
  Border? borderSettings,
  Color color = ColorRes.primaryColor,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: color,
        border: borderSettings,
        borderRadius: BorderRadius.circular(100),
      ),
      child: child,
    ),
  );
}
