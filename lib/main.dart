import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/route_manager.dart';
import 'package:medicine_app/screens/MLSplashScreen.dart';
import 'package:medicine_app/store/AppStore.dart';
import 'package:medicine_app/utils/AppTheme.dart';
import 'package:medicine_app/utils/MLDataProvider.dart';
import 'package:nb_utils/nb_utils.dart';

AppStore appStore = AppStore();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialize(aLocaleLanguageList: languageList());

  appStore.toggleDarkMode(value: getBoolAsync('isDarkModeOnPref'));

  defaultRadius = 10;
  defaultToastGravityGlobal = ToastGravity.BOTTOM;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: '${'MediLab'}${!isMobile ? ' ${platformName()}' : ''}',
        home: MLSplashScreen(),
        theme: !appStore.isDarkModeOn ? AppThemeData.lightTheme : AppThemeData.darkTheme,
        navigatorKey: navigatorKey,
        scrollBehavior: SBehavior(),
        supportedLocales: LanguageDataModel.languageLocales(),
        localeResolutionCallback: (locale, supportedLocales) => locale,
      ),
    );

    // return GetMaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: '${'Steroid'}${!isMobile ? ' ${platformName()}' : ''}',
    //   home: MLSplashScreen(),
    //   theme: !appStore.isDarkModeOn ? AppThemeData.lightTheme : AppThemeData.darkTheme,
    //   navigatorKey: navigatorKey,
    //   scrollBehavior: SBehavior(),
    //   supportedLocales: LanguageDataModel.languageLocales(),
    //   localeResolutionCallback: (locale, supportedLocales) => locale,
    // );
  }
}
