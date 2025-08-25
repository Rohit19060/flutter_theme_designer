import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../core/themes.dart';

enum ThemeDesign {
  lightNew,
  darkNew,
  light,
  dark,
  highContrastLight,
  highContrastDark,
  colorSchemeLight,
  colorSchemeDark;

  const ThemeDesign();
}

extension ThemeDesignExt on ThemeDesign {
  ThemeData get theme {
    switch (this) {
      case ThemeDesign.lightNew:
        return lightTheme;
      case ThemeDesign.darkNew:
        return darkTheme;
      case ThemeDesign.light:
        return ThemeData.light();
      case ThemeDesign.dark:
        return ThemeData.dark();
      case ThemeDesign.highContrastLight:
        return ThemeData.from(colorScheme: const ColorScheme.highContrastLight());
      case ThemeDesign.highContrastDark:
        return ThemeData.from(colorScheme: const ColorScheme.highContrastDark());
      case ThemeDesign.colorSchemeLight:
        return ThemeData.from(colorScheme: const ColorScheme.light());
      case ThemeDesign.colorSchemeDark:
        return ThemeData.from(colorScheme: const ColorScheme.dark());
    }
  }
}

final themeDesignState = StateProvider<ThemeDesign>((ref) => ThemeDesign.values.first);

class CustomThemeData {
  CustomThemeData(this.themeData);
  ThemeData themeData;

  @override
  String toString() => '''
    ThemeData(
      useMaterial3: ${themeData.useMaterial3},
      brightness: ${themeData.brightness},
      primaryColor: ${themeData.primaryColor},
      primaryColorLight: ${themeData.primaryColorLight},
      primaryColorDark: ${themeData.primaryColorDark},
      canvasColor: ${themeData.canvasColor},
      scaffoldBackgroundColor: ${themeData.scaffoldBackgroundColor},
      cardColor: ${themeData.cardColor},
      dividerColor: ${themeData.dividerColor},
      highlightColor: ${themeData.highlightColor},
      splashColor: ${themeData.splashColor},
      unselectedWidgetColor: ${themeData.unselectedWidgetColor},
      disabledColor: ${themeData.disabledColor},
      secondaryHeaderColor: ${themeData.secondaryHeaderColor},
      dialogBackgroundColor: ${themeData.dialogTheme.backgroundColor},
      indicatorColor: ${themeData.tabBarTheme.indicatorColor},
      hintColor: ${themeData.hintColor},
      buttonTheme: ${themeData.buttonTheme},
      primaryTextTheme: ${themeData.primaryTextTheme},
      inputDecorationTheme: ${themeData.inputDecorationTheme},
      iconTheme: ${themeData.iconTheme},
      primaryIconTheme: ${themeData.primaryIconTheme},
      sliderTheme: ${themeData.sliderTheme},
      tabBarTheme: ${themeData.tabBarTheme},
      chipTheme: ${themeData.chipTheme},
      dialogTheme: ${themeData.dialogTheme},
      textSelectionTheme: ${themeData.textSelectionTheme},
      checkboxTheme: ${themeData.checkboxTheme},
      radioTheme: ${themeData.radioTheme},
      switchTheme: ${themeData.switchTheme},
      bottomAppBarTheme: ${themeData.bottomAppBarTheme},
    )
    ''';
}
