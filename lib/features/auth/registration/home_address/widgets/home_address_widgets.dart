import 'package:coin_pay/core/common/widgets/text_widgets.dart';
import 'package:coin_pay/core/utils/text_res.dart';
import 'package:coin_pay/features/auth/general_registration_widgets.dart';
import 'package:coin_pay/features/auth/registration/provider/registration_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeAddressWidgets extends ConsumerWidget {
  final TextEditingController addressLineController;
  final TextEditingController cityController;
  final TextEditingController postCodeController;
  const HomeAddressWidgets({
    required this.addressLineController,
    required this.cityController,
    required this.postCodeController,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(registrationState.notifier);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        const AppText(
          text: TextRes.homeAddress,
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
        TextFormWidget(
          formName: "Address Line",
          hintText: "Mr. John Doe",
          controller: addressLineController,
          onChanged: (value) =>
              notifier.onHomeAddressChanged(addressLine: value),
        ),
        const SizedBox(height: 15),
        TextFormWidget(
          formName: "City",
          hintText: "City, State",
          controller: cityController,
          onChanged: (value) => notifier.onHomeAddressChanged(city: value),
        ),
        const SizedBox(height: 15),
        TextFormWidget(
          formName: "Postcode",
          hintText: "Ex.00000",
          controller: postCodeController,
          onChanged: (value) => notifier.onHomeAddressChanged(postCode: value),
        ),
      ],
    );
  }
}
