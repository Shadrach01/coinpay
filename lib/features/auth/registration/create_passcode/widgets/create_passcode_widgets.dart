import 'package:coin_pay/core/common/widgets/text_widgets.dart';
import 'package:coin_pay/core/utils/color_res.dart';
import 'package:coin_pay/core/utils/text_res.dart';
import 'package:coin_pay/features/auth/registration/provider/registration_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreatePasscodeWidgets extends ConsumerStatefulWidget {
  final PageController pageController;
  const CreatePasscodeWidgets({
    super.key,
    required this.pageController,
  });

  @override
  ConsumerState<CreatePasscodeWidgets> createState() =>
      _CreatePasscodeWidgetsState();
}

class _CreatePasscodeWidgetsState extends ConsumerState<CreatePasscodeWidgets> {
  String enteredPin = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const AppText(
              text: TextRes.createPasscode,
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
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                4,
                (index) {
                  return Container(
                    margin: const EdgeInsets.all(6),
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: index < enteredPin.length
                          ? Colors.green
                          : CupertinoColors.activeBlue.withOpacity(0.1),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: _numberRows(
              ref: ref,
              onTap: (number) {
                setState(() {
                  if (enteredPin.length < 4) {
                    enteredPin += number.toString();

                    ref
                        .read(registrationState.notifier)
                        .onPasscodeChanged(enteredPin);
                  }
                  if (enteredPin.length == 4) {
                    widget.pageController.nextPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.ease);
                  }
                });
              },
              onCancel: () {
                setState(() {
                  if (enteredPin.isNotEmpty) {
                    enteredPin = enteredPin.substring(
                        0,
                        enteredPin.length -
                            1); // Remove the last digit fomr the enteredPin
                    ref
                        .read(registrationState.notifier)
                        .onPasscodeChanged(enteredPin);
                  }
                });
              }),
        ),
      ],
    );
  }
}

Widget _numberRows({
  required WidgetRef ref,
  required void Function(int) onTap,
  required void Function()? onCancel,
}) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: NumberButton(
              ref: ref,
              number: 1,
              alphabet: "",
              onTap: () => onTap(1),
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: NumberButton(
              ref: ref,
              number: 2,
              alphabet: "ABC",
              onTap: () => onTap(2),
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: NumberButton(
              ref: ref,
              number: 3,
              alphabet: "DEF",
              onTap: () => onTap(3),
            ),
          ),
        ],
      ),
      const SizedBox(height: 5),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: NumberButton(
              ref: ref,
              number: 4,
              alphabet: "GHI",
              onTap: () => onTap(4),
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: NumberButton(
              ref: ref,
              number: 5,
              alphabet: "JKL",
              onTap: () => onTap(5),
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: NumberButton(
              ref: ref,
              number: 6,
              alphabet: "MNO",
              onTap: () => onTap(6),
            ),
          ),
        ],
      ),
      const SizedBox(height: 5),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: NumberButton(
              ref: ref,
              number: 7,
              alphabet: "PQRS",
              onTap: () => onTap(7),
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: NumberButton(
              ref: ref,
              number: 8,
              alphabet: "TUV",
              onTap: () => onTap(8),
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: NumberButton(
              ref: ref,
              number: 9,
              alphabet: "WXYZ",
              onTap: () => onTap(9),
            ),
          ),
        ],
      ),
      const SizedBox(height: 5),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 130),
          Expanded(
            child: NumberButton(
              ref: ref,
              number: 0,
              alphabet: "",
              onTap: () => onTap(0),
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: IconButton(
              icon: const Icon(Icons.backspace_outlined),
              onPressed: onCancel,
            ),
          ),
        ],
      ),
    ],
  );
}

class NumberButton extends StatelessWidget {
  final WidgetRef ref;
  final int number;
  final String alphabet;

  final void Function()? onTap;
  const NumberButton({
    super.key,
    required this.ref,
    required this.number,
    required this.alphabet,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: ColorRes.bgLightColor,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              color: ColorRes.lightGrey,
              blurRadius: 1,
              offset: Offset(0, 1.6),
              blurStyle: BlurStyle.inner,
            ),
          ],
        ),
        child: Column(
          children: [
            AppText(
              text: number.toString(),
              size: 14,
              weight: FontWeight.bold,
            ),
            AppText(
              text: alphabet,
              size: 10,
              weight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
