import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/hotel_app.dart';
import 'package:hotel_booking_app/providers/theme_provider.dart';
import 'package:hotel_booking_app/utils/enum.dart';
import 'package:provider/provider.dart';


class AppTheme {
  static bool get isLightMode {
    return applicationcontext == null
        ? true
        : applicationcontext!.read<ThemeProvider>().isLightMode;
  }

  // colors
  static Color get primaryColor {
    ColorType _colortypedata = applicationcontext == null
        ? ColorType.Verdigris
        : applicationcontext!.read<ThemeProvider>().colorType;

    return getColor(_colortypedata);
  }

  static Color get scaffoldBackgroundColor =>
      isLightMode ? Color(0xFFF7F7F7) : Color(0xFF1A1A1A);

  static Color get redErrorColor =>
      isLightMode ? Color(0xFFAC0000) : Color(0xFFAC0000);

  static Color get backgroundColor =>
      isLightMode ? Color(0xFFFFFFFF) : Color(0xFF2C2C2C);

  static Color get primaryTextColor =>
      isLightMode ? Color(0xFF262626) : Color(0xFFFFFFFF);

  static Color get secondaryTextColor =>
      isLightMode ? Color(0xFFADADAD) : Color(0xFF6D6D6D);

  static Color get whiteColor => Color(0xFFFFFFFF);
  static Color get backColor => Color(0xFF262626);

  static Color get fontcolor =>
      isLightMode ? Color(0xFF1A1A1A) : Color(0xFFF7F7F7);

  static ThemeData get getThemeData =>
      isLightMode ? _buildLightTheme() : _buildDarkTheme();

  static TextTheme _buildTextTheme(TextTheme base) {
    FontFamilyType _fontType = applicationcontext == null
        ? FontFamilyType.WorkSans
        : applicationcontext!.read<ThemeProvider>().fontType;
    return base.copyWith(
      displayLarge: getTextStyle(_fontType, base.displayLarge!), //f-size 96
      displayMedium: getTextStyle(_fontType, base.displayMedium!), //f-size 60
      displaySmall: getTextStyle(_fontType, base.displaySmall!), //f-size 48
      headlineMedium: getTextStyle(_fontType, base.headlineMedium!), //f-size 34
      headlineSmall: getTextStyle(_fontType, base.headlineSmall!), //f-size 24
      titleLarge: getTextStyle(
        _fontType,
        base.titleLarge!.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ), //f-size 20
      labelLarge: getTextStyle(_fontType, base.labelLarge!), //f-size 14
      bodySmall: getTextStyle(_fontType, base.bodySmall!), //f-size 12
      bodyLarge: getTextStyle(_fontType, base.bodyLarge!), //f-size 16
      bodyMedium: getTextStyle(_fontType, base.bodyMedium!), //f-size 14
      titleMedium: getTextStyle(
        _fontType,
        base.titleMedium!.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ), //f-size 16
      titleSmall: getTextStyle(_fontType, base.titleSmall!), //f-size 14
      labelSmall: getTextStyle(_fontType, base.labelSmall!), //f-size 10
    );
  }

// we also get some Light and Dark color variants
  static Color getColor(ColorType _colordata) {
    switch (_colordata) {
      case ColorType.Verdigris:
        return isLightMode ? Color(0xFF4FBE9F) : Color(0xFF4FBE9F);
      case ColorType.Malibu:
        return isLightMode ? Color(0xFF5DCAEC) : Color(0xFF5DCAEC);
      case ColorType.DarkSkyBlue:
        return isLightMode ? Color(0xFF458CEA) : Color(0xFF458CEA);
      case ColorType.BilobaFlower:
        return isLightMode ? Color(0xFFff5f5f) : Color(0xFFff5f5f);
    }
  }

  static TextStyle getTextStyle(
      FontFamilyType _fontFamilyType, TextStyle textStyle) {
    switch (_fontFamilyType) {
      case FontFamilyType.Montserrat:
        return GoogleFonts.montserrat(textStyle: textStyle);
      case FontFamilyType.WorkSans:
        return GoogleFonts.workSans(textStyle: textStyle);
      case FontFamilyType.Varela:
        return GoogleFonts.varela(textStyle: textStyle);
      case FontFamilyType.Satisfy:
        return GoogleFonts.satisfy(textStyle: textStyle);
      case FontFamilyType.DancingScript:
        return GoogleFonts.dancingScript(textStyle: textStyle);
      case FontFamilyType.KaushanScript:
        return GoogleFonts.kaushanScript(textStyle: textStyle);
      default:
        return GoogleFonts.roboto(textStyle: textStyle);
    }
  }

  static ThemeData _buildLightTheme() {
    final ColorScheme colorScheme = const ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: primaryColor,
    );
    final ThemeData base = ThemeData.light();

    return base.copyWith(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      canvasColor: scaffoldBackgroundColor,
      buttonTheme: _buttonThemeData(colorScheme),
      dialogTheme: _dialogTheme(),
      cardTheme: _cardTheme(),
      textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.textTheme),
      platform: TargetPlatform.iOS,
      visualDensity: VisualDensity.adaptivePlatformDensity, colorScheme: colorScheme.copyWith(background: backgroundColor),
    );
  }

  static ThemeData _buildDarkTheme() {
    final ColorScheme colorScheme = const ColorScheme.dark().copyWith(
      primary: primaryColor,
      secondary: primaryColor,
    );
    final ThemeData base = ThemeData.dark();

    return base.copyWith(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      canvasColor: scaffoldBackgroundColor,
      buttonTheme: _buttonThemeData(colorScheme),
      dialogTheme: _dialogTheme(),
      cardTheme: _cardTheme(),
      textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.textTheme),
      platform: TargetPlatform.iOS,
      visualDensity: VisualDensity.adaptivePlatformDensity, colorScheme: colorScheme.copyWith(background: backgroundColor),
    );
  }

  static ButtonThemeData _buttonThemeData(ColorScheme colorScheme) {
    return ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      colorScheme: colorScheme,
      textTheme: ButtonTextTheme.primary,
    );
  }

  static DialogTheme _dialogTheme() {
    return DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 0,
      backgroundColor: backgroundColor,
    );
  }

  static CardTheme _cardTheme() {
    return CardTheme(
      clipBehavior: Clip.antiAlias,
      color: backgroundColor,
      shadowColor: secondaryTextColor.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 8,
      margin: const EdgeInsets.all(0),
    );
  }

  static get mapCardDecoration => BoxDecoration(
        color: AppTheme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(24.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Theme.of(applicationcontext!).dividerColor,
              offset: Offset(4, 4),
              blurRadius: 8.0),
        ],
      );
  static get buttonDecoration => BoxDecoration(
        color: AppTheme.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(24.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Theme.of(applicationcontext!).dividerColor,
            blurRadius: 8,
            offset: Offset(4, 4),
          ),
        ],
      );
  static get searchBarDecoration => BoxDecoration(
        color: AppTheme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(38)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Theme.of(applicationcontext!).dividerColor,
            blurRadius: 8,
            // offset: Offset(4, 4),
          ),
        ],
      );

  static get boxDecoration => BoxDecoration(
        color: AppTheme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Theme.of(applicationcontext!).dividerColor,
            //   offset: Offset(2, 2),
            blurRadius: 8,
          ),
        ],
      );
}

enum ThemeModeType {
  system,
  dark,
  light,
}
