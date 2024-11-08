import 'package:coin_pay/core/common/widgets/text_widgets.dart';
import 'package:coin_pay/core/utils/image_res.dart';
import 'package:coin_pay/core/utils/text_res.dart';
import 'package:flutter/widgets.dart';

class WelcomePageWidget extends StatelessWidget {
  const WelcomePageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(ImageRes.welcome_image),
        const SizedBox(height: 30),
        const AppText(
          text: TextRes.congratulations,
          size: 30,
          weight: FontWeight.bold,
        ),
        const AppText(
          text: TextRes.welcomeToCoinpay,
          size: 30,
          weight: FontWeight.bold,
        ),
        const AppText(
          text: TextRes.welcomeToCoinpay2,
          size: 14,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
