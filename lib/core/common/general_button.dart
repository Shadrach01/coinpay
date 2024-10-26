import 'package:coin_pay/core/utils/color_res.dart';
import 'package:flutter/material.dart';

/// THE BUTTON USED ALMOST ALL THRORUGH THE APP 

Widget generalButton({
  int? index,
void Function()? onTap,
double? width,
double? height,
required Widget child,

}){
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: width,
      height: height,
      color: ColorRes.primaryColor,
      child: child,
    ),
  );
}