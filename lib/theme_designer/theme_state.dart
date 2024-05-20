import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ThemeDesign {
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
      dialogBackgroundColor: ${themeData.dialogBackgroundColor},
      indicatorColor: ${themeData.indicatorColor},
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

class CustomContainerData {
  CustomContainerData(this.container, this.width, this.height);
  Container container;
  final double width, height;

  @override
  String toString() => '''
    Container(
      width: $width,
      height: $height,
      padding: ${container.padding},
      decoration: ${container.decoration},
      child: ${container.child},
    )
    ''';
}
