import 'package:get/get.dart';
import 'package:easy_course/feature/authentication/presentation/screen/onboarding_screen.dart';
import 'package:easy_course/feature/dashboard/views/dashboard_screen.dart';
import 'package:easy_course/feature/splash/presentation/splash_screen_view.dart';




class RouteHelper {
  static const String initial = '/';
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String home = '/home';
  static const String selectLoginOption = '/select-login-option';
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  static const String collectInformation = '/collect-information';
  static const String forgotPassword = '/forgot-password';
  static const String otpVerify = '/otp-verify';
  static const String resetPassword = '/reset-password';
  static const String welcomeScreen = '/welcome-screen';
  static const String dashboard = '/dashboard';
  static const String version = '/version';
  static const String notification = '/notification';
  static const String selectOrigin = '/select-origin';
  static const String selectDestination = '/select-destination';
  static const String selectDate = '/select-date';
  static const String order = '/order';
  static const String profile = '/profile';

  static getInitialRoute() => splash;
  static getSplashRoute() => splash;
  static getOnboardingRoute() => onboarding;
  static getSignInRoute() => signIn;
  static getDashboardRoute() => dashboard;
  static getVersionRoute() => version;
  static getSelectOriginRoute() => selectOrigin;
  static getSelectDestinationRoute() => selectDestination;
  static getSelectDateRoute() => selectDate;
  static getOrderRoute() => order;
  static getProfileRoute() => profile;

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const SplashScreenView()),
    GetPage(name: splash, page: () => const SplashScreenView()),
    GetPage(name: onboarding, page: () => const OnboardingScreen()),
    GetPage(name: dashboard, page: () => const DashboardScreen()),

  ];
}