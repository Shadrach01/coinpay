import 'package:coin_pay/core/common/widgets/text_widgets.dart';
import 'package:coin_pay/core/utils/text_res.dart';
import 'package:coin_pay/features/auth/general_registration_widgets.dart';
import 'package:coin_pay/features/auth/registration/provider/registration_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddEmailWidgets extends ConsumerWidget {
  final TextEditingController emailController;
  const AddEmailWidgets({super.key, required this.emailController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(registrationState.notifier);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        const AppText(
          text: TextRes.addEmail,
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
          formName: "Email",
          hintText: "name@example.com",
          preffixIcon: Icons.email_outlined,
          controller: emailController,
          onChanged: (value) => notifier.onEmailChanged(value),
        )
      ],
    );
  }
}
