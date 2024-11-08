import 'package:coin_pay/core/utils/color_res.dart';
import 'package:coin_pay/features/auth/registration/country_of_residence/widget/country_of_residents_widgets.dart';
import 'package:coin_pay/features/auth/registration/general_registration_widgets.dart';
import 'package:coin_pay/features/auth/registration/provider/registration_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class CountryOfResidence extends ConsumerStatefulWidget {
  final PageController pageController;
  const CountryOfResidence({
    super.key,
    required this.pageController,
  });

  @override
  ConsumerState<CountryOfResidence> createState() => _CountryOfResidenceState();
}

class _CountryOfResidenceState extends ConsumerState<CountryOfResidence> {
  @override
  Widget build(BuildContext context) {
    // Watch the registration state
    final selectedCountry = ref.watch(
      registrationState.select((state) => state.countryOfResidence),
    );
    final bool isCountrySelected = selectedCountry != null;

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
            const CountryOfResidenceWidgets(),
            registrationButton(
              onTap: () {
                FocusScope.of(context).unfocus();

                isCountrySelected
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
              text: "Continue",
              isActive: isCountrySelected,
            )
          ],
        ),
      ),
    );
  }
}
