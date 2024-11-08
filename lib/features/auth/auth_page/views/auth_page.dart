import 'package:coin_pay/core/utils/color_res.dart';
import 'package:coin_pay/features/auth/auth_page/widgets/auth_page_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthPage extends StatelessWidget {
  final PageController pageController;
  const AuthPage({
    super.key,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        color: ColorRes.bgLightColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AuthPageWidgets(),
            const SizedBox(height: 27),
            authbuttons(
              signUp: () => pageController.nextPage(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.ease),
              logIn: () => Get.toNamed('/log_in_page'),
            ),
            const SizedBox(height: 25),
            const AcceptOffer(),
          ],
        ),
      ),
    );
  }
}
