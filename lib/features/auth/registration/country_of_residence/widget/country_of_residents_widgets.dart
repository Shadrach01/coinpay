import 'package:coin_pay/core/common/widgets/text_widgets.dart';
import 'package:coin_pay/core/utils/constants/constants.dart';
import 'package:coin_pay/core/utils/text_res.dart';
import 'package:coin_pay/features/auth/registration/provider/registration_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class CountryOfResidenceWidgets extends ConsumerWidget {
  const CountryOfResidenceWidgets({super.key});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    // Get the current selected country from Riverpod provider
    final selectedCountry = ref.watch(
      registrationState.select((state) => state.countryOfResidence),
    );

    final country = Constants().countryDialCodes[0];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        const AppText(
          text: TextRes.countryOfResidence,
          size: 20,
          weight: FontWeight.bold,
        ),
        const Padding(
          padding: EdgeInsets.only(right: 50.0),
          child: AppText(
            text: TextRes.accurateInfo,
            size: 12,
          ),
        ),
        const SizedBox(height: 20),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppText(
              text: "Country",
              size: 20,
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => _showCountryDropDown(context, ref),
              child: Container(
                width: double.infinity,
                height: 55,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: selectedCountry != null
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Image.asset(selectedCountry['flag']!),
                              const SizedBox(width: 15),
                              AppText(
                                text: selectedCountry['name']!,
                                size: 17,
                              ),
                            ],
                          ),
                          const Icon(Icons.keyboard_arrow_down),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Image.asset(country['flag']!),
                              const SizedBox(width: 3),
                              AppText(
                                text: country['name']!,
                                size: 15,
                              ),
                            ],
                          ),
                          const Icon(Icons.keyboard_arrow_down),
                        ],
                      ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

void _showCountryDropDown(BuildContext context, WidgetRef ref) async {
  await showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0), // Adjust padding as needed
          child: SizedBox(
            height: 300, // Set height for the dropdown
            child: Column(
              children: [
                const AppText(
                  text: "Select Country",
                  size: 20,
                  weight: FontWeight.bold,
                ),
                const Divider(),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: Constants().countryDialCodes.length,
                    itemBuilder: (context, index) {
                      final country = Constants().countryDialCodes[index];
                      return ListTile(
                        leading: Image.asset(
                          country['flag']!,
                          width: 24,
                          height: 24,
                        ),
                        title: AppText(
                          text: country['name']!,
                          size: 15,
                        ),
                        onTap: () {
                          ref
                              .read(registrationState.notifier)
                              .onCountryOfResidenceChanged(country);
                          Get.back();
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
