import 'package:coin_pay/core/utils/color_res.dart';
import 'package:coin_pay/features/auth/general_registration_widgets.dart';
import 'package:coin_pay/features/auth/registration/home_address/widgets/home_address_widgets.dart';
import 'package:coin_pay/features/auth/registration/provider/registration_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class HomeAddress extends ConsumerStatefulWidget {
  final PageController pageController;
  const HomeAddress({
    super.key,
    required this.pageController,
  });

  @override
  ConsumerState<HomeAddress> createState() => _HomeAddressState();
}

class _HomeAddressState extends ConsumerState<HomeAddress> {
  // text controllers
  final addressLineController = TextEditingController();
  final cityController = TextEditingController();
  final postCodeController = TextEditingController();

  // Dispose off the controllers
  @override
  void dispose() {
    addressLineController.dispose();
    cityController.dispose();
    postCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // registration state watch
    final stateWatch = ref.watch(registrationState);

    final homeAddressState = stateWatch.homeAddress;

    // check if all the fields have been filled
    final bool stateNotEmpty = homeAddressState.addressLine.isNotEmpty &&
        homeAddressState.city.isNotEmpty &&
        homeAddressState.postCode.isNotEmpty;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 15.0,
          right: 15,
          bottom: 35,
        ),
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HomeAddressWidgets(
                    addressLineController: addressLineController,
                    cityController: cityController,
                    postCodeController: postCodeController,
                  ),
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
          ),
        ),
      ),
    );
  }
}
