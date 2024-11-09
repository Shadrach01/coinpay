import 'package:coin_pay/core/utils/color_res.dart';
import 'package:coin_pay/features/auth/general_registration_widgets.dart';
import 'package:coin_pay/features/auth/registration/phone_and_password_page/widgets/phone_and_password_widgets.dart';
import 'package:coin_pay/features/auth/registration/provider/registration_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class PhoneAndPasswordPage extends ConsumerStatefulWidget {
  final PageController pageController;
  const PhoneAndPasswordPage({
    super.key,
    required this.pageController,
  });

  @override
  ConsumerState<PhoneAndPasswordPage> createState() =>
      _ConsumerRegistrationPageState();
}

class _ConsumerRegistrationPageState
    extends ConsumerState<PhoneAndPasswordPage> {
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
    final registrationStateValue = ref.watch(registrationState);

    final selectedCountry = ref.watch(
      registrationState.select((state) => state.selectedCountry),
    );

    // Check if the the password & number is not empty
    final isPasswordFilled = registrationStateValue.password.isNotEmpty;
    final isNumberFilled = registrationStateValue.phoneNumber.isNotEmpty;

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
            PhoneAndPasswordWidgets(
              numberController: numberController,
              pwController: pwController,
            ),
            registrationButton(
              onTap: () {
                FocusScope.of(context).unfocus();

                isPasswordFilled & isNumberFilled
                    ? showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          return verifyNumberPopUp(
                            context,
                            selectedCountry!['dial_code']!,
                            registrationStateValue.phoneNumber,
                            widget.pageController,
                          );
                        },
                      )
                    : Get.snackbar(
                        backgroundColor: ColorRes.primaryColor,
                        "Error",
                        "Please fill all boxes",
                        colorText: ColorRes.bgLightColor,
                        duration: const Duration(milliseconds: 700),
                        leftBarIndicatorColor: Colors.red,
                      );
              },
              text: " Sign up",
              isActive: isPasswordFilled && isNumberFilled,
            )
          ],
        ),
      ),
    );
  }
}
