import 'package:coin_pay/core/utils/color_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StepProgress extends StatefulWidget {
  final double currentStep;
  final double steps;
  const StepProgress({
    super.key,
    required this.currentStep,
    required this.steps,
  });

  @override
  State<StepProgress> createState() => _StepProgressState();
}

class _StepProgressState extends State<StepProgress> {
  double widthProgress = 0;

  @override
  void initState() {
    _onSizeWidget();
    super.initState();
  }

  void _onSizeWidget() {
    WidgetsBinding.instance.addPersistentFrameCallback(
      (timeStamp) {
        if (mounted && context.size is Size) {
          Size size = context.size!;
          widthProgress = size.width / (widget.steps - 1);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 4,
          width: Get.width,
          decoration: BoxDecoration(
            color: ColorRes.contentPrimary.withOpacity(0.4),
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Stack(
            children: [
              AnimatedContainer(
                width: widthProgress * widget.currentStep,
                duration: const Duration(milliseconds: 200),
                decoration: const BoxDecoration(
                  color: ColorRes.primaryColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
