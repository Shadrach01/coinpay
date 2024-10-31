import 'package:coin_pay/core/common/general_button.dart';
import 'package:coin_pay/core/common/widgets/text_widgets.dart';
import 'package:coin_pay/core/utils/color_res.dart';
import 'package:coin_pay/features/auth/registration/number_and_password/widgets/registration_widgets.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
          bottom: 50,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const RegistrationWidgets(),
            generalButton(
              onTap: () {},
              color: ColorRes.lightGrey,
              height: 60,
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 18,
                  ),
                  child: AppText(
                    text: "Sign up",
                    weight: FontWeight.bold,
                    size: 18,
                    color: ColorRes.contentPrimary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
