import 'package:coin_pay/core/common/general_button.dart';
import 'package:coin_pay/core/common/widgets/text_widgets.dart';
import 'package:coin_pay/core/utils/color_res.dart';
import 'package:coin_pay/core/utils/constants/constants.dart';
import 'package:coin_pay/core/utils/image_res.dart';
import 'package:coin_pay/core/utils/text_res.dart';
import 'package:coin_pay/features/auth/registration/general_registration_widgets.dart';
import 'package:coin_pay/features/auth/registration/provider/registration_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class PhoneAndPasswordWidgets extends ConsumerWidget {
  final TextEditingController numberController;
  final TextEditingController pwController;
  const PhoneAndPasswordWidgets({
    super.key,
    required this.numberController,
    required this.pwController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(registrationState.notifier);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppText(
          text: TextRes.createAccount,
          weight: FontWeight.bold,
          size: 22,
        ),
        const SizedBox(height: 5),
        const AppText(
          text: TextRes.enterNumber,
          size: 14,
        ),
        const SizedBox(height: 15),
        InputNumber(
          numberController: numberController,
        ),
        const SizedBox(height: 20),
        TextFormWidget(
            controller: pwController,
            formName: "Password",
            hintText: "Enter password",
            obscureText: true,
            preffixIcon: Icons.lock_clock_outlined,
            suffixIcon: Icons.remove_red_eye_outlined,
            onChanged: (value) {
              notifier.onPasswordChanged(value);
            })
      ],
    );
  }
}

class InputNumber extends ConsumerWidget {
  final TextEditingController? numberController;
  final TextEditingController? dialCodeController;
  const InputNumber({
    super.key,
    this.numberController,
    this.dialCodeController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get the current selected country from Riverpod provider
    final notifier = ref.read(registrationState.notifier);
    final selectedCountry = ref.watch(
      registrationState.select((state) => state.selectedCountry),
    );

    final country = Constants().countryDialCodes[0];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => _showCountryDropDown(context, ref),
                child: Container(
                  margin: const EdgeInsets.only(top: 25),
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: selectedCountry != null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Image.asset(selectedCountry['flag']!)),
                            const SizedBox(width: 3),
                            Expanded(
                              child: AppText(
                                text: selectedCountry['dial_code']!,
                                size: 15,
                              ),
                            )
                          ],
                        )
                      : Row(
                          children: [
                            Expanded(child: Image.asset(country['flag']!)),
                            const SizedBox(width: 3),
                            Expanded(
                              child: AppText(
                                text: country['dial_code']!,
                                size: 15,
                              ),
                            )
                          ],
                        ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 3,
              child: TextFormWidget(
                controller: numberController,
                hintText: "Mobile number",
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (value) {
                  notifier.onPhoneChanged(value);
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}

void _showCountryDropDown(
  BuildContext context,
  WidgetRef ref,
) async {
  await showModalBottomSheet(
    context: context,
    builder: (context) {
      return ListView.builder(
        itemCount: Constants().countryDialCodes.length,
        itemBuilder: (context, index) {
          final country = Constants().countryDialCodes[index];
          return ListTile(
            leading: Image.asset(
              country['flag']!,
            ),
            title: AppText(
              text: country['dial_code']!,
              size: 15,
            ),
            onTap: () {
              ref
                  .read(registrationState.notifier)
                  .onCountryCodeChanged(country);
              Get.back();
            },
          );
        },
      );
    },
  );
}

Widget verifyNumberPopUp(
  BuildContext context,
  String dialCode,
  String number,
  PageController pageController,
) {
  return AlertDialog(
    backgroundColor: ColorRes.bgLightColor,
    content: Padding(
      padding: EdgeInsets.zero,
      child: SizedBox(
        height: 450,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.cancel_outlined),
              ),
            ),
            Image.asset(ImageRes.verify_dialog_image),
            const SizedBox(height: 15),
            const AppText(
              text: TextRes.verifyNumber,
              size: 17,
              weight: FontWeight.bold,
              textAlign: TextAlign.center,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AppText(
                  text: TextRes.verifyNumber2,
                  size: 13,
                  textAlign: TextAlign.center,
                ),
                AppText(
                  text: dialCode,
                  size: 10,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(width: 3),
                AppText(
                  text: number,
                  size: 10,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(height: 30),
            _confirmbuttons(pageController, context),
          ],
        ),
      ),
    ),
  );
}

// Yes and No Buttons
Widget _confirmbuttons(
  PageController pageController,
  BuildContext context,
) {
  return Column(
    children: [
      // Sign up button
      generalButton(
        onTap: () {
          pageController.nextPage(
            duration: const Duration(milliseconds: 200),
            curve: Curves.ease,
          );
          Get.back();
        },
        child: const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 18,
            ),
            child: AppText(
              text: "Yes",
              size: 15,
              color: ColorRes.bgLightColor,
            ),
          ),
        ),
      ),
      const SizedBox(height: 6),
      // Log in button
      generalButton(
        onTap: () => Get.back(),
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
              text: "No",
              size: 15,
              color: ColorRes.primaryColor,
            ),
          ),
        ),
      ),
    ],
  );
}
