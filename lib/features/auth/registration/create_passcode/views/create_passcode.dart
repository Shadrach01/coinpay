import 'package:coin_pay/features/auth/registration/create_passcode/widgets/create_passcode_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreatePasscode extends ConsumerStatefulWidget {
  final PageController pageController;
  const CreatePasscode({
    super.key,
    required this.pageController,
  });

  @override
  ConsumerState<CreatePasscode> createState() => _CreatePasscodeState();
}

class _CreatePasscodeState extends ConsumerState<CreatePasscode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
          bottom: 50,
        ),
        child: CreatePasscodeWidgets(
          pageController: widget.pageController,
        ),
      ),
    );
  }
}
