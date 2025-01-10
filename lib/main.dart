import 'dart:io';
import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:test_project/common/controller/theme_controller.dart';
import 'package:test_project/common/model/messages.dart';
import 'package:test_project/helper/di_container.dart';
import 'package:test_project/helper/route_helper.dart';
import 'package:test_project/localization/localization_controller.dart';
import 'package:test_project/theme/light_theme.dart';
import 'package:test_project/util/app_constants.dart';
import 'package:url_strategy/url_strategy.dart';


final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

Future<void> main() async {
  if(GetPlatform.isIOS || GetPlatform.isAndroid) {
    HttpOverrides.global = MyHttpOverrides();
  }
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  Map<String, Map<String, String>> languages = await init();
  runApp(MyApp(languages: languages));
}

class MyApp extends StatefulWidget {
  final Map<String, Map<String, String>> languages;
  const MyApp({super.key, required this.languages});

  @override
  State<MyApp> createState() => _MyAppState();
}


Future<String?> initDynamicLinks() async {
  final appLinks = AppLinks();
  final uri = await appLinks.getInitialLink();
  String? path;
  if (uri != null) {
    path = uri.path;
  }else{
    path = null;
  }
  return path;

}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(builder: (themeController) {
      return GetBuilder<LocalizationController>(builder: (localizeController) {
        return GetMaterialApp(
          title: AppConstants.appName,
          debugShowCheckedModeBanner: false,
          navigatorKey: Get.key,
          theme: lightTheme,
          locale: localizeController.locale,
          translations: Messages(languages: widget.languages),
          fallbackLocale: Locale(AppConstants.languages[0].languageCode, AppConstants.languages[0].countryCode),
          initialRoute: RouteHelper.getInitialRoute(),
          getPages: RouteHelper.routes,
          defaultTransition: Transition.cupertino,
          transitionDuration: const Duration(milliseconds: 500),
        );
      },
      );
    },
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}