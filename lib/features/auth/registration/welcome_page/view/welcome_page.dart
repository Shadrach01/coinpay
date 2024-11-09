import 'package:coin_pay/core/utils/color_res.dart';
import 'package:coin_pay/features/auth/general_registration_widgets.dart';
import 'package:coin_pay/features/auth/registration/welcome_page/widget/welcome_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class WelcomePage extends ConsumerStatefulWidget {
  const WelcomePage({
    super.key,
  });

  @override
  ConsumerState<WelcomePage> createState() => _ConsumerWelcomePageState();
}

class _ConsumerWelcomePageState extends ConsumerState<WelcomePage> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.bgLightColor,
      body: Container(
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
          bottom: 50,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const WelcomePageWidget(),
            registrationButton(
              onTap: () {
                Get.offAllNamed('/home_page');
              },
              text: "Continue",
              isActive: true,
            )
          ],
        ),
      ),
    );
  }
}
