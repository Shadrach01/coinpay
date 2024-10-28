import 'package:coin_pay/core/common/general_button.dart';
import 'package:coin_pay/core/common/widgets/text_widgets.dart';
import 'package:coin_pay/core/utils/color_res.dart';
import 'package:coin_pay/core/utils/image_res.dart';
import 'package:coin_pay/core/utils/text_res.dart';
import 'package:flutter/material.dart';

class AuthPageWidgets extends StatelessWidget {
  const AuthPageWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(ImageRes.auth_page),
          const SizedBox(height: 70),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.0),
            child: AppText(
              text: TextRes.authPageText1,
              textAlign: TextAlign.center,
              weight: FontWeight.w600,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 18),
          const AppText(
            text: TextRes.authPageText2,
            weight: FontWeight.w500,
            size: 15,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// Login and signup Buttons
Widget authbuttons({
  void Function()? signUp,
  void Function()? logIn,
}) {
  return Column(
    children: [
      // Sign up button
      generalButton(
        onTap: signUp,
        child: const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 18,
            ),
            child: AppText(
              text: "Sign up",
              size: 15,
              color: ColorRes.bgLightColor,
            ),
          ),
        ),
      ),
      const SizedBox(height: 15),
      // Log in button
      generalButton(
        onTap: logIn,
        color: ColorRes.bgLightColor,
        borderSettings: Border.all(
          color: ColorRes.primaryColor,
          width: 2,
        ),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 18,
            ),
            child: AppText(
              text: "Log in",
              size: 15,
              color: ColorRes.primaryColor,
            ),
          ),
        ),
      ),
    ],
  );
}

// Accept offer texts
class AcceptOffer extends StatelessWidget {
  const AcceptOffer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AppText(
          text: TextRes.acceptOffer,
          size: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              text: TextRes.terms,
              size: 13,
              color: ColorRes.primaryColor,
              textDecoration: TextDecoration.underline,
              decorationColor: ColorRes.primaryColor,
              decorationthickness: 2,
            ),
            SizedBox(width: 5),
            AppText(
              text: "and",
              size: 13,
            ),
            SizedBox(width: 5),
            AppText(
              text: TextRes.privacy,
              size: 13,
              color: ColorRes.primaryColor,
              textDecoration: TextDecoration.underline,
              decorationColor: ColorRes.primaryColor,
              decorationthickness: 2,
            ),
          ],
        )
      ],
    );
  }
}
