import 'package:coin_pay/core/utils/color_res.dart';
import 'package:coin_pay/features/auth/auth_page/views/auth_page.dart';
import 'package:coin_pay/features/auth/registration/add_email/views/add_email.dart';
import 'package:coin_pay/features/auth/registration/country_of_residence/view/country_of_residence.dart';
import 'package:coin_pay/features/auth/registration/create_passcode/views/create_passcode.dart';
import 'package:coin_pay/features/auth/registration/home_address/view/home_address.dart';
import 'package:coin_pay/features/auth/registration/personal_info/view/personal_info.dart';
import 'package:coin_pay/features/auth/registration/phone_and_password_page/views/phone_and_password_page.dart';
import 'package:coin_pay/features/auth/registration/registration_page/widget/step_progress.dart';
import 'package:coin_pay/features/auth/registration/welcome_page/view/welcome_page.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final PageController _controller = PageController(initialPage: 0);

  double _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page!;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorRes.bgLightColor,
        toolbarHeight: 40,
      ),
      backgroundColor: ColorRes.bgLightColor,
      body: Column(
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(
              right: 15,
              left: 15,
              bottom: 10,
            ),
            child: StepProgress(
              currentStep: _currentPage,
              steps: 8,
            ),
          ),
          Expanded(
            child: PageView(
              controller: _controller,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                AuthPage(pageController: _controller),
                PhoneAndPasswordPage(pageController: _controller),
                AddEmail(pageController: _controller),
                HomeAddress(pageController: _controller),
                PersonalInfo(pageController: _controller),
                CountryOfResidence(pageController: _controller),
                CreatePasscode(pageController: _controller),
                const WelcomePage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
