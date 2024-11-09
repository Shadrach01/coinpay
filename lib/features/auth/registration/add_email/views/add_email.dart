import 'package:coin_pay/core/utils/color_res.dart';
import 'package:coin_pay/features/auth/registration/add_email/widgets/add_email_widgets.dart';
import 'package:coin_pay/features/auth/general_registration_widgets.dart';
import 'package:coin_pay/features/auth/registration/provider/registration_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class AddEmail extends ConsumerStatefulWidget {
  final PageController pageController;
  const AddEmail({
    super.key,
    required this.pageController,
  });

  @override
  ConsumerState<AddEmail> createState() => _ConsumerAddEmailState();
}

class _ConsumerAddEmailState extends ConsumerState<AddEmail> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Watch the registration state
    final registrationStateValue = ref.watch(registrationState);

    // is email text filled
    final isEmailFilled = registrationStateValue.email.isNotEmpty;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
          bottom: 50,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AddEmailWidgets(
              emailController: emailController,
            ),
            registrationButton(
              onTap: () {
                FocusScope.of(context).unfocus();
                isEmailFilled
                    ? widget.pageController.nextPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.ease)
                    : Get.snackbar(
                        backgroundColor: ColorRes.primaryColor,
                        "Error",
                        "Please enter your email",
                        colorText: ColorRes.bgLightColor,
                        duration: const Duration(milliseconds: 700),
                        leftBarIndicatorColor: Colors.red,
                      );
              },
              text: " Sign up",
              isActive: isEmailFilled,
            )
          ],
        ),
      ),
    );
  }
}
