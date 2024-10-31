import 'package:coin_pay/core/common/general_button.dart';
import 'package:coin_pay/core/common/widgets/app_container.dart';
import 'package:coin_pay/core/common/widgets/app_text_field.dart';
import 'package:coin_pay/core/common/widgets/text_widgets.dart';
import 'package:coin_pay/core/utils/color_res.dart';
import 'package:coin_pay/core/utils/constants/constants.dart';
import 'package:coin_pay/core/utils/image_res.dart';
import 'package:coin_pay/core/utils/text_res.dart';
import 'package:coin_pay/features/auth/registration/provider/registrations_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class RegistrationWidgets extends StatelessWidget {
  const RegistrationWidgets({super.key});

  @override
  Widget build(BuildContext context) {
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
        const InputNumber(),
        const SizedBox(height: 20),
        inputPassword(),
      ],
    );
  }
}

class InputNumber extends ConsumerWidget {
  final TextEditingController? numberController;
  const InputNumber({
    super.key,
    this.numberController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get the current selected country from Riverpod provider
    final selectedCountry = ref.watch(selectedCountryProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppText(
          text: "Phone",
          size: 18,
        ),
        Row(
          children: [
            const AppContainer(
              width: 90,
              child: Row(),
              // child: DropdownButtonHideUnderline(
              //   child: DropdownButton(
              //     value: selectedCountry,
              //     isExpanded: true,
              //     items: Constants()
              //         .countryDialCodes
              //         .map(
              //           (country) => DropdownMenuItem(
              //             child: Row(
              //               children: [
              //                 Image.asset(
              //                   country['flag']!,
              //                   width: 24,
              //                 ),
              //                 AppText(text: country['dial_code']!),
              //               ],
              //             ),
              //           ),
              //         )
              //         .toList(),
              //     onChanged: (newSelectedCountry) {
              //       // update the seleted country in riverpod
              //       ref.read(selectedCountryProvider.notifier).state =
              //           newSelectedCountry;
              //     },
              //   ),
              // ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: appTextField(
                controller: numberController,
                hintText: "Mobile number",
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
            ),
          ],
        )
      ],
    );
  }
}

// Widget inputNumber(WidgetRef ref) {
//   return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const AppText(
//           text: "Phone",
//           size: 18,
//         ),
//         Row(
//           children: [
//             AppContainer(
//               width: 90,
//               child: DropdownButton(items: Constants, onChanged: onChanged)
//             ),
//             const SizedBox(width: 10),
//             Expanded(
//               child: appTextField(
//                 controller: numberController,
//                 hintText: "Mobile number",
//                 keyboardType: TextInputType.number,
//                 inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//               ),
//             ),
//           ],
//         )
//       ],
//     );
// }

Widget inputPassword({
  TextEditingController? passwordController,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const AppText(
        text: "Password",
        size: 18,
      ),
      appTextField(
        controller: passwordController,
        hintText: "Password",
        obscureText: true,
        width: double.infinity,
        prefixIcon: Icons.lock_clock_outlined,
        suffixIcon: Icons.remove_red_eye_outlined,
      )
    ],
  );
}

Widget countryList() {
  return ListView.builder(
      itemCount: Constants().countryDialCodes.length,
      itemBuilder: (context, index) {
        final country = Constants().countryDialCodes[index];
        return Row(
          children: [
            Image.asset(country['flag']!),
            Expanded(child: AppText(text: country['dial_code']!)),
          ],
        );
      });
}
// TODO: Make sure that when they click out of the alert dialog, nothing happens,

Widget verifyNumberPopUp(BuildContext context) {
  return AlertDialog(
    content: Padding(
      padding: EdgeInsets.zero,
      child: SizedBox(
        height: 450,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.topRight,
              child: Icon(Icons.cancel_rounded),
            ),
            Image.asset(ImageRes.verify_dialog_image),
            const SizedBox(height: 15),
            const AppText(
              text: TextRes.verifyNumber,
              size: 17,
              weight: FontWeight.bold,
              textAlign: TextAlign.center,
            ),
            const AppText(
              text: TextRes.verifyNumber2,
              size: 13,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            confirmbuttons(),
          ],
        ),
      ),
    ),
  );
}

// Yes and No Buttons
Widget confirmbuttons({
  void Function()? yes,
  void Function()? no,
}) {
  return Column(
    children: [
      // Sign up button
      generalButton(
        onTap: () => Get.toNamed('/add_email'),
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
        onTap: () => Get.previousRoute,
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
