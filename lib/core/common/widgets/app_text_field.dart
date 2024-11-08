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
  TextInputType? keyboardType,
  List<TextInputFormatter>? inputFormatters,
  void Function()? onTap,
  bool readonly = false,
  void Function(String)? onChanged,
  String? Function(String?)? validator,
}) {
  return AppContainer(
    width: width,
    child: Center(
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        style: const TextStyle(
          color: ColorRes.lightGrey,
          fontSize: 20,
        ),
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: ColorRes.lightGrey,
            fontSize: 15
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 12,
          ),
          border: InputBorder.none,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
        ),
        readOnly: readonly,
        onTap: onTap,
        onChanged: onChanged,
        validator: validator,
      ),
    ),
  );
}
