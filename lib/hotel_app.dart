import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotel_booking_app/common/common.dart';
import 'package:hotel_booking_app/language/appLocalizations.dart';
import 'package:hotel_booking_app/modules/splash/introduction_screen.dart';
import 'package:hotel_booking_app/modules/splash/splash_screen.dart';
import 'package:hotel_booking_app/providers/theme_provider.dart';
import 'package:hotel_booking_app/routes/routes.dart';
import 'package:hotel_booking_app/utils/enum.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

BuildContext? applicationcontext;

class HotelApp extends StatefulWidget {
  const HotelApp({Key? key}) : super(key: key);

  @override
  _HotelAppState createState() => _HotelAppState();
}

class _HotelAppState extends State<HotelApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (_,provider,child){
      applicationcontext = context;
      final ThemeData _theme = provider.themeData;
      return MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale("en"), //english
            Locale("fr"), //french
            Locale("jp"), //japaneese
            Locale("ar"), //arabic
          ],
          navigatorKey: navigatorKey,
          title: "Hotel",
          debugShowCheckedModeBanner: false,
          theme: _theme,
          routes: _buildRoutes(),
          builder: (BuildContext context,Widget ? child){
            _setFirstTimeSomeData(context,_theme);
            return Directionality(
                textDirection: context.read<ThemeProvider>().languageType == LanguageType.ar ? TextDirection.rtl:TextDirection.ltr,
                child: Builder(
                    builder: (BuildContext context){
                      return MediaQuery(
                          data: MediaQuery.of(context).copyWith(
                              textScaler: TextScaler.linear(MediaQuery.of(context).size.width > 360 ? 1.0 :
                              (MediaQuery.of(context).size.width >= 340 ? 0.9 : 0.8))
                          ),
                          child: child ?? const SizedBox()
                      );
                    }
                )
            );
          }
      );
    });
  }

  void _setFirstTimeSomeData(BuildContext context, ThemeData theme) {
    applicationcontext = context;
    _setStatusBarNavigationBarTheme(theme);
    //call some theme basic data set in the app like color,font,theme mode,language
    context
        .read<ThemeProvider>()
        .checkAndSetThemeMode(MediaQuery.of(context).platformBrightness);
    context
        .read<ThemeProvider>()
        .checkAndSetLanguage();
    context
        .read<ThemeProvider>()
        .checkAndSetFonType();
    context
        .read<ThemeProvider>()
        .checkAndSetColorType();
  }

  Map<String,WidgetBuilder>_buildRoutes() {
    return {
      RoutesName.Splash: (BuildContext context) => SplashScreen(),
      RoutesName.IntroductionScreen: (BuildContext context) => IntroductionScreen(),
    };
  }

  void _setStatusBarNavigationBarTheme(ThemeData themeData) {
    final brightness = !kIsWeb && Platform.isAndroid
        ? (themeData.brightness == Brightness.light
        ? Brightness.dark
        : Brightness.light)
        : themeData.brightness;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: brightness,
      statusBarIconBrightness: brightness,
      systemNavigationBarColor: themeData.scaffoldBackgroundColor,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: brightness,
    ));
  }
}

