import 'package:coin_pay/core/common/general_button.dart';
import 'package:coin_pay/core/utils/color_res.dart';
import 'package:coin_pay/features/onboarding/provider/onboarding_notifier.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnboardingPages extends StatelessWidget {
  final PageController controller;
  final String imagePath;
  final int index;
  final String text;

  const OnboardingPages({
    super.key,
    required this.controller,
    required this.imagePath,
    required this.index,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 142,
        ),
        Container(
          height: 260,
          width: 182,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 88),
        DotsIndicator(
          dotsCount: 3,
          position: index,
          decorator: DotsDecorator(
            size: const Size(37, 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3),
            ),
            activeSize: const Size(16, 8),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            activeColor: ColorRes.primaryColor,
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 45,
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}

// Next button
Widget onboardingButton(
  int index,
  PageController controller,
  WidgetRef ref,
) {
  return generalButton(
    index: index,
    onTap: () {
      // If the index is less than 2, which mean it's not in the
      // last page yet, update the index in the INDEXDOTPROVIDER to +1
      if (index < 2) {
        controller.animateToPage(
          index + 1,
          duration: const Duration(milliseconds: 300),
          curve: Curves.linear,
        );
        // Update the page index
      ref.read(indexDotProvider.notifier).changeIndex(index + 1);
      } else {
        Get.offAllNamed('/auth_page');
      }

    },
    height: 56,
    child: const Center(
      child: Text(
        "Next",
        style: TextStyle(
          color: ColorRes.bgLightColor,
          fontSize: 15,
        ),
      ),
    ),
  );
}
