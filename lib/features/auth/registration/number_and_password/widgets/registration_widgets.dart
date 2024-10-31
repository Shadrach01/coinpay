import 'package:coin_pay/core/common/widgets/app_container.dart';
import 'package:coin_pay/core/common/widgets/app_text_field.dart';
import 'package:coin_pay/core/common/widgets/text_widgets.dart';
import 'package:coin_pay/core/utils/constants/constants.dart';
import 'package:coin_pay/core/utils/text_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        inputNumber(),
        const SizedBox(height: 20),
        inputPassword(),
      ],
    );
  }
}

Widget inputNumber({
  TextEditingController? numberController,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const AppText(
        text: "Phone",
        size: 18,
      ),
      Row(
        children: [
           AppContainer(
            width: 90,
            child: countryList(),
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
        Expanded( child: AppText(text: country['dial_code']!)),
      ],
    );
  }
  );
}


