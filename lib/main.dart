import 'dart:io';
import 'package:bot_toast/bot_toast.dart';
import 'package:color_extractor/app/data/ce_database.dart';
import 'package:color_extractor/app/modules/utils/app_util.dart';
import 'package:color_extractor/app/modules/utils/color_util.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'app/modules/details/bindings/details_binding.dart';
import 'app/modules/details/views/details_view.dart';
import 'app/modules/roottab/bindings/roottab_binding.dart';
import 'app/modules/roottab/views/roottab_view.dart';
import 'app/modules/setttings/bindings/setttings_binding.dart';
import 'app/modules/setttings/views/setttings_view.dart';
import 'app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(_initApp());
}

Widget ceInitGetMaterialApp({
  Widget Function(BuildContext, Widget?)? builder,
}) {
  return GetMaterialApp(
    darkTheme: ThemeData.dark(),
    useInheritedMediaQuery: true,
    themeMode: ThemeMode.light,
    fallbackLocale: const Locale("zh", "CN"),
    debugShowCheckedModeBanner: false,
    initialRoute: AppPages.INITIAL,
    getPages: Pages,
    defaultTransition: Transition.rightToLeft,
    theme: ThemeData(
      scaffoldBackgroundColor: CEColorUtil.ceColorWithHex("#F4F4F4"),
      indicatorColor: Colors.grey,
      brightness: Brightness.light,
      splashFactory: NoSplash.splashFactory,
      splashColor: Colors.white.withOpacity(0),
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0.0,
      ),
    ),
    builder: builder,
    navigatorObservers: [BotToastNavigatorObserver()],
    supportedLocales: const [
      Locale('zh', 'CN'),
      Locale('en', 'US'),
    ],
    localizationsDelegates: const [
      GlobalWidgetsLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
  );
}

_initApp() {
  if (!kIsWeb && Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  _setBotToast();

  Widget body = ceInitGetMaterialApp(
    builder: (context, child) {
      final botToastBuilder = BotToastInit();
      CEDatabaseService().init();
      return ScreenUtilInit(
        designSize: const Size(375, 812),
        useInheritedMediaQuery: true,
        builder: (p0, p1) {
          Widget body = GestureDetector(
            onTap: () {
              AppUtil.keyboardDismiss(context);
            },
            child: child,
          );
          body = botToastBuilder(context, body);
          return body;
        },
      );
    },
  );
  return body;
}

void _setBotToast() {
  BotToast.defaultOption.notification.animationDuration =
      const Duration(seconds: 2);
}

List<GetPage<dynamic>> Pages = [
  GetPage(
    name: '/roottab',
    page: () => const RoottabView(),
    binding: RoottabBinding(),
  ),
  GetPage(
    name: '/setttings',
    page: () => const SetttingsView(),
    binding: SetttingsBinding(),
  ),
  GetPage(
    name: '/details',
    page: () => const DetailsView(),
    binding: DetailsBinding(),
  ),
];
