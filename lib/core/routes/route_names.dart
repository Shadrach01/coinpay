import 'package:coin_pay/core/routes/app_routes_names.dart';
import 'package:coin_pay/features/auth/log_in_page/views/log_in_page.dart';
import 'package:coin_pay/features/auth/registration/registration_page/view/registration_page.dart';
import 'package:coin_pay/features/home_page/view/home_page.dart';
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
      name: AppRoutesNames.REGISTRATION_PAGE,
      page: () => const RegistrationPage(),
    ),
   

    GetPage(
      name: AppRoutesNames.LOGIN_PAGE,
      page: () => const LogInPage(),
    ),
    GetPage(
      name: AppRoutesNames.HOME_PAGE,
      page: () => const HomePage(),
    ),
  ];
}
