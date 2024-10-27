import 'package:coin_pay/core/routes/app_routes_names.dart';
import 'package:coin_pay/features/auth/auth_page/views/auth_page.dart';
import 'package:coin_pay/features/onboarding/views/onboarding_screens.dart';
import 'package:get/get.dart';

class RouteNames {
  static List<GetPage> routes = [
    GetPage(name: AppRoutesNames.ONBOARDING, page: () => OnboardingScreens()),
    GetPage(name: AppRoutesNames.AUTH_PAGE, page: () => AuthPage()),
  ];
}
