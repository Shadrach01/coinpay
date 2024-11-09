import 'package:coin_pay/core/common/widgets/app_container.dart';
import 'package:coin_pay/core/utils/color_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget appTextField({
  TextEditingController? controller,
  String hintText = "Type here",
  bool obscureText = false,
  double width = 200,
  IconData? suffixIcon,
  IconData? prefixIcon,
  Color prefixIconColor = ColorRes.lightGrey,
  Color textColor = ColorRes.lightGrey,
  TextInputType? keyboardType,
  List<TextInputFormatter>? inputFormatters,
  void Function()? onTap,
  bool readonly = false,
  Color borderColor = ColorRes.lightGrey,
  void Function(String)? onChanged,
  String? Function(String?)? validator,
  double horizontalPadding = 10,
  double verticalPadding = 12,
}) {
  return AppContainer(
    width: width,
    borderColor: borderColor,
    child: Center(
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        style: TextStyle(
          color: textColor,
          fontSize: 20,
        ),
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: textColor,
            fontSize: 15
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          border: InputBorder.none,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
          prefixIconColor: prefixIconColor,
        ),
        readOnly: readonly,
        onTap: onTap,
        onChanged: onChanged,
        validator: validator,
      ),
    ),
  );
}
