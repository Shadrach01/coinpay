import 'package:coin_pay/core/utils/color_res.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final TextAlign? textAlign;
  final TextDecoration textDecoration;
  final Color? decorationColor;
  final double? decorationthickness;
  final FontWeight weight;
  final double? height;

  const AppText({
    super.key,
    required this.text,
    this.size = 34,
    this.height,
    this.textAlign,
    this.color = ColorRes.contentPrimary,
    this.textDecoration = TextDecoration.none,
    this.weight = FontWeight.normal,
    this.decorationColor,
    this.decorationthickness,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: size,
        fontWeight: weight,
        color: color,
        decoration: textDecoration,
        decorationColor: decorationColor,
        decorationThickness: decorationthickness,
        height: height,
      ),
    );
  }
}
