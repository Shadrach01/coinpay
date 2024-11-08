import 'package:coin_pay/core/common/general_button.dart';
import 'package:coin_pay/core/common/widgets/app_text_field.dart';
import 'package:coin_pay/core/common/widgets/text_widgets.dart';
import 'package:coin_pay/core/utils/color_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormWidget extends StatelessWidget {
  final String formName;
  final String hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final IconData? preffixIcon;
  final IconData? suffixIcon;
  final void Function()? onTap;
  final bool readonly;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  const TextFormWidget({
    super.key,
    this.formName = '',
    this.hintText = '',
    this.controller,
    this.obscureText = false,
    this.preffixIcon,
    this.suffixIcon,
    this.onTap,
    this.readonly = false,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: formName,
          size: 16,
        ),
        const SizedBox(height: 5),
        appTextField(
          controller: controller,
          hintText: hintText,
          obscureText: obscureText,
          width: double.infinity,
          prefixIcon: preffixIcon,
          suffixIcon: suffixIcon,
          onTap: onTap,
          readonly: readonly,
          onChanged: onChanged,
          validator: validator,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
        )
      ],
    );
  }
}

Widget registrationButton({
  void Function()? onTap,
  String text = '',
  bool isActive = false,
}) {
  return generalButton(
    onTap: onTap,
    color: isActive ? ColorRes.primaryColor : ColorRes.lightGrey,
    height: 60,
    child: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
        child: AppText(
          text: text,
          size: 15,
          color: isActive ? ColorRes.bgLightColor : ColorRes.contentPrimary,
        ),
      ),
    ),
  );
}
