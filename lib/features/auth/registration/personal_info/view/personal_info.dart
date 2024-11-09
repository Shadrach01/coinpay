import 'package:coin_pay/core/utils/color_res.dart';
import 'package:coin_pay/features/auth/general_registration_widgets.dart';
import 'package:coin_pay/features/auth/registration/personal_info/widget/personal_info_widgets.dart';
import 'package:coin_pay/features/auth/registration/provider/registration_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class PersonalInfo extends ConsumerStatefulWidget {
  final PageController pageController;
  const PersonalInfo({
    super.key,
    required this.pageController,
  });

  @override
  ConsumerState<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends ConsumerState<PersonalInfo> {
  final fulNameController = TextEditingController();

  final userNameController = TextEditingController();

  final dobController = TextEditingController();

  @override
  void dispose() {
    fulNameController.dispose();
    userNameController.dispose();
    dobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final stateObserver = ref.watch(registrationState);

    // watch the home address state
    final personalInfoState = stateObserver.personalInfo;

    // check if the home address is not empty
    final bool stateNotEmpty = personalInfoState.fullName.isNotEmpty &&
        personalInfoState.userName.isNotEmpty &&
        personalInfoState.dob.isNotEmpty;

    // Build UI
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
          bottom: 50,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: PersonalInfoWidgets(
                  fulNameController: fulNameController,
                  userNameController: userNameController,
                  dobController: dobController,
                ),
              ),
            ),
            const SizedBox(height: 20),
            registrationButton(
              text: "Continue",
              onTap: () {
                FocusScope.of(context).unfocus();

                stateNotEmpty
                    ? widget.pageController.nextPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.ease)
                    : Get.snackbar(
                        backgroundColor: ColorRes.primaryColor,
                        "Error",
                        "Please enter your full address",
                        colorText: ColorRes.bgLightColor,
                        duration: const Duration(milliseconds: 700),
                        leftBarIndicatorColor: Colors.red,
                      );
              },
              isActive: stateNotEmpty,
            ),
          ],
        ),
      ),
    );
  }
}
