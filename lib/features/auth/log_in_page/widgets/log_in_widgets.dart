import 'package:coin_pay/core/common/widgets/text_widgets.dart';
import 'package:coin_pay/core/utils/color_res.dart';
import 'package:coin_pay/core/utils/constants/constants.dart';
import 'package:coin_pay/core/utils/text_res.dart';
import 'package:coin_pay/features/auth/log_in_page/provider/login_notifier.dart';
import 'package:coin_pay/features/auth/general_registration_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class LogInPageWidgets extends ConsumerWidget {
  final TextEditingController numberController;
  final TextEditingController pwController;
  const LogInPageWidgets({
    super.key,
    required this.numberController,
    required this.pwController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(loginState.notifier);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppText(
          text: TextRes.login,
          weight: FontWeight.bold,
          size: 22,
        ),
        const SizedBox(height: 5),
        const AppText(
          text: TextRes.enterNumberToLogin,
          size: 14,
        ),
        const SizedBox(height: 10),
        _LogInInputNumber(
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
            notifier.onPasswordEntered(value);
          },
        ),
        const SizedBox(height: 10),
        const AppText(
          text: "Forgot password?",
          size: 12,
          color: ColorRes.primaryColor,
        ),
      ],
    );
  }
}

class _LogInInputNumber extends ConsumerWidget {
  final TextEditingController? numberController;

  const _LogInInputNumber({
    this.numberController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get the current selected country from Riverpod provider
    final notifier = ref.read(loginState.notifier);
    final selectedCountry = ref.watch(
      loginState.select((state) => state.selectedCountry),
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
                  notifier.onPhoneNumberEntered(value);
                },
              ),
            ),
          ],
        ),
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
              ref.read(loginState.notifier).onCountryCodeChanged(country);
              Get.back();
            },
          );
        },
      );
    },
  );
}
