import 'package:coin_pay/core/utils/color_res.dart';
import 'package:coin_pay/features/auth/general_registration_widgets.dart';
import 'package:coin_pay/features/auth/log_in_page/provider/login_notifier.dart';
import 'package:coin_pay/features/auth/log_in_page/widgets/log_in_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';


class LogInPage extends ConsumerStatefulWidget {
  const LogInPage({
    super.key,
  });

  @override
  ConsumerState<LogInPage> createState() => _ConsumerRegistrationPageState();
}

class _ConsumerRegistrationPageState extends ConsumerState<LogInPage> {
  final numberController = TextEditingController();
  final pwController = TextEditingController();

  @override
  void dispose() {
    numberController.dispose;
    pwController.dispose;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Watch the registration state
    final logInStateValue = ref.watch(loginState);

    // Check if the the password & number is not empty
    final isPasswordFilled = logInStateValue.password.isNotEmpty;
    final isNumberFilled = logInStateValue.phoneNumber.isNotEmpty;

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
            LogInPageWidgets(
              numberController: numberController,
              pwController: pwController,
            ),
            registrationButton(
              onTap: () {
                FocusScope.of(context).unfocus();

                isPasswordFilled & isNumberFilled
                    ? Get.offAllNamed('/home_page')
                    : Get.snackbar(
                        backgroundColor: ColorRes.primaryColor,
                        "Error",
                        "Please fill all boxes",
                        colorText: ColorRes.bgLightColor,
                        duration: const Duration(milliseconds: 700),
                        leftBarIndicatorColor: Colors.red,
                      );
              },
              text: " Log in",
              isActive: isPasswordFilled && isNumberFilled,
            )
          ],
        ),
      ),
    );
  }
}
