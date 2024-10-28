import 'package:coin_pay/core/utils/color_res.dart';
import 'package:coin_pay/features/auth/auth_page/widgets/auth_page_widgets.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

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
              signUp: () {},
              logIn: () {},
            ),
            const SizedBox(height: 25),
            const AcceptOffer(),
          ],
        ),
      ),
    );
  }
}
