import 'package:coin_pay/core/utils/color_res.dart';
import 'package:coin_pay/core/utils/image_res.dart';
import 'package:coin_pay/core/utils/text_res.dart';
import 'package:coin_pay/features/onboarding/widgets/onboarding_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnboardingScreens extends ConsumerWidget {
  OnboardingScreens({super.key});

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        color: ColorRes.bgLightColor,
        child: Stack(
          children: [
            // The stack showing the three welcome pages
            PageView(
              controller: _controller,
              children: [
                OnboardingPages(
                  controller: _controller,
                  imagePath: ImageRes.onboarding_1,
                  index: 0,
                  text: TextRes.onboadringTextOne,
                ),
                OnboardingPages(
                  controller: _controller,
                  imagePath: ImageRes.onboarding_2,
                  index: 1,
                  text: TextRes.onboadringTextTwo,
                ),
                OnboardingPages(
                  controller: _controller,
                  imagePath: ImageRes.onboarding_3,
                  index: 2,
                  text: TextRes.onboadringTextThree,
                ),
              ],
            ),

            Positioned(
              bottom: 70,
              right: 20,
              left: 20,
              child: onboardingButton(2, _controller, ref),
            ),
          ],
        ),
      ),
    );
  }
}
