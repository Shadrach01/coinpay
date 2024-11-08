import 'package:coin_pay/core/common/widgets/text_widgets.dart';
import 'package:coin_pay/core/utils/text_res.dart';
import 'package:coin_pay/features/auth/registration/general_registration_widgets.dart';
import 'package:coin_pay/features/auth/registration/provider/registration_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PersonalInfoWidgets extends ConsumerWidget {
  final TextEditingController fulNameController;
  final TextEditingController userNameController;
  final TextEditingController dobController;

  // final void Function()? onTap;

  const PersonalInfoWidgets({
    super.key,
    required this.fulNameController,
    required this.userNameController,
    required this.dobController,
    // required this.onTap,
  });

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final stateNotifier = ref.read(registrationState.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        const AppText(
          text: TextRes.personalInfo,
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
          formName: "Full name",
          hintText: "Mr. John Doe",
          controller: fulNameController,
          onChanged: (value) {
            stateNotifier.onPersonalInfoChanged(fullName: value);
          },
        ),
        const SizedBox(height: 15),
        TextFormWidget(
          formName: "Username",
          hintText: "@username",
          controller: userNameController,
          onChanged: (value) {
            stateNotifier.onPersonalInfoChanged(userName: value);
          },
        ),
        const SizedBox(height: 15),
        TextFormWidget(
          formName: "Date of Birth",
          hintText: "MM/DD/YYYY",
          controller: dobController,
          preffixIcon: Icons.calendar_month_outlined,
          readonly: true,
          onTap: () => _selectDate(context, dobController, ref),
        ),
      ],
    );
  }
}

Future<void> _selectDate(
  BuildContext context,
  TextEditingController dobController,
  WidgetRef ref,
) async {
  DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
  );
  if (pickedDate != null) {
    // Format the date as desired
    String formattedDate =
        "${pickedDate.month}/${pickedDate.day}/${pickedDate.year}";

    // Update the controller
    dobController.text = formattedDate;

    // Update the registration state
    ref
        .read(registrationState.notifier)
        .onPersonalInfoChanged(dob: formattedDate);
  }
}
