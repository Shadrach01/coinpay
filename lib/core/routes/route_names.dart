import 'package:coin_pay/core/routes/app_routes_names.dart';
import 'package:coin_pay/features/auth/auth_page/views/auth_page.dart';
import 'package:coin_pay/features/auth/log_in_page/views/log_in_page.dart';
import 'package:coin_pay/features/auth/registration/add_email/views/add_email.dart';
import 'package:coin_pay/features/auth/registration/phone_number_and_password/views/registration_page.dart';
import 'package:coin_pay/features/onboarding/views/onboarding_screens.dart';
import 'package:get/get.dart';

/// ROUTES FOR THE APP
class RouteNames {
  static List<GetPage> routes = [
    GetPage(
      name: AppRoutesNames.ONBOARDING,
      page: () => OnboardingScreens(),
    ),
    GetPage(
      name: AppRoutesNames.AUTH_PAGE,
      page: () => const AuthPage(),
    ),
    GetPage(
      name: AppRoutesNames.REGISTRATION_PAGE,
      page: () => const RegistrationPage(),
    ),
    GetPage(
      name: AppRoutesNames.ADD_EMAIL_PAGE,
      page: () => const AddEmail(),
    ),
    GetPage(
      name: AppRoutesNames.LOGIN_PAGE,
      page: () => const LogInPage(),
    ),
  ];
}
