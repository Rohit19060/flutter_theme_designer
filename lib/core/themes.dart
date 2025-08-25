import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const backgroundColor = Color(0xFFF2F5FB),
    nonHighlight = Color(0xA2000000),
    placeHolder = Color(0x7C000000),
    bottomBar = Color(0xFFEAEFF7),
    secondary50 = Color(0x7C001429),
    primary70 = Color(0xAF4FE4FE),
    secondary = Color(0xFF001429);

final lightTheme = ThemeData(
  textSelectionTheme: const TextSelectionThemeData(cursorColor: secondary),
  fontFamily: 'Nunito',
  scaffoldBackgroundColor: backgroundColor,
  iconTheme: const IconThemeData(color: secondary),
  dialogTheme: const DialogThemeData(surfaceTintColor: Colors.white),
  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: Colors.transparent,
    labelTextStyle: WidgetStateProperty.all(const TextStyle(color: secondary, fontSize: 14, fontWeight: FontWeight.w400)),
    iconTheme: WidgetStateProperty.all(const IconThemeData(color: secondary)),
  ),
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: ZoomPageTransitionsBuilder(allowEnterRouteSnapshotting: false),
      TargetPlatform.windows: ZoomPageTransitionsBuilder(allowEnterRouteSnapshotting: false),
    },
  ),
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
    backgroundColor: Colors.transparent,
    centerTitle: true,
    elevation: 0,
    titleTextStyle: TextStyle(color: secondary, fontSize: 18, fontWeight: FontWeight.w500),
  ),
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF4FE4FE),
    primary: const Color(0xFF4FE4FE),
    secondary: secondary,
  ),
  shadowColor: secondary,
  dividerColor: secondary,
  secondaryHeaderColor: secondary,
  listTileTheme: ListTileThemeData(
    selectedColor: secondary.withOpacity(0.1),
    selectedTileColor: secondary.withOpacity(0.1),
    iconColor: secondary,
    textColor: secondary,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
    titleTextStyle: const TextStyle(color: secondary, fontSize: 20, fontWeight: FontWeight.w500),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    isDense: true,
    constraints: BoxConstraints(maxWidth: 500),
    labelStyle: TextStyle(color: secondary),
    activeIndicatorBorder: BorderSide(color: Color(0xFF4FE4FE), width: 2),
    hintStyle: TextStyle(color: placeHolder, fontSize: 16),
    contentPadding: EdgeInsets.all(16),
    floatingLabelStyle: TextStyle(color: secondary),
    filled: true,
    hoverColor: Colors.transparent,
    fillColor: Colors.white,
    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
    errorBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30)), borderSide: BorderSide(color: Colors.transparent)),
    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(100)), borderSide: BorderSide(color: Colors.transparent)),
    disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
    alignLabelWithHint: true,
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 64, fontWeight: FontWeight.w500, color: secondary), // Medium 64
    displayMedium: TextStyle(fontSize: 48, fontWeight: FontWeight.w400, color: secondary), // Regular 48
    headlineLarge: TextStyle(fontSize: 36, fontWeight: FontWeight.w700, color: secondary), // Bold 36
    headlineMedium: TextStyle(fontSize: 36, fontWeight: FontWeight.w400, color: secondary), // Regular 36
    headlineSmall: TextStyle(fontSize: 32, fontWeight: FontWeight.w500, color: secondary), // Medium 32
    titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: secondary), // Bold 24
    titleMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: secondary), // Medium 24
    titleSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: secondary), // Semibold 24
    bodySmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: secondary), // Medium 20
    bodyMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: secondary), // Medium 20
    labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: secondary), // Regular 16
    labelMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: secondary), // Regular 14
    labelSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: secondary), // Regular 12
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
      foregroundColor: WidgetStateProperty.all(Colors.white),
      textStyle: WidgetStateProperty.all(
        const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, fontFamily: 'Nunito'),
      ),
      backgroundColor: WidgetStateProperty.all(const Color(0xFF4FE4FE)),
      padding: WidgetStateProperty.all(const EdgeInsets.symmetric(vertical: 16)),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
      foregroundColor: WidgetStateProperty.all(secondary),
      textStyle: WidgetStateProperty.all(
        const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, fontFamily: 'Nunito'),
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: const Color(0xFF4FE4FE),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      textStyle: const TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w700,
      ),
    ),
  ),
);

final darkTheme = ThemeData(
  textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.white),
  fontFamily: 'Nunito',
  scaffoldBackgroundColor: secondary,
  iconTheme: const IconThemeData(color: Colors.white),
  dialogTheme: const DialogThemeData(surfaceTintColor: Colors.white),
  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: Colors.transparent,
    labelTextStyle: WidgetStateProperty.all(const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400)),
    iconTheme: WidgetStateProperty.all(const IconThemeData(color: Colors.white)),
  ),
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: ZoomPageTransitionsBuilder(allowEnterRouteSnapshotting: false),
      TargetPlatform.windows: ZoomPageTransitionsBuilder(allowEnterRouteSnapshotting: false),
    },
  ),
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
    backgroundColor: Colors.transparent,
    centerTitle: true,
    elevation: 0,
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
  ),
  shadowColor: Colors.white,
  dividerColor: Colors.white,
  secondaryHeaderColor: secondary,
  listTileTheme: const ListTileThemeData(
    iconColor: secondary,
    textColor: secondary,
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
    titleTextStyle: TextStyle(color: secondary, fontSize: 20, fontWeight: FontWeight.w500),
  ),
  inputDecorationTheme: InputDecorationTheme(
    isDense: true,
    constraints: const BoxConstraints(maxWidth: 500),
    labelStyle: const TextStyle(color: Colors.white),
    activeIndicatorBorder: const BorderSide(color: Color(0xFF4FE4FE), width: 2),
    hintStyle: const TextStyle(color: Color(0xFF4FE4FE), fontSize: 16),
    contentPadding: const EdgeInsets.all(16),
    floatingLabelStyle: const TextStyle(color: Colors.white),
    filled: true,
    hoverColor: Colors.transparent,
    fillColor: Colors.white.withOpacity(0.2),
    border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
    errorBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
    focusedBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30)), borderSide: BorderSide(color: Colors.transparent)),
    enabledBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(100)), borderSide: BorderSide(color: Colors.transparent)),
    disabledBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
    alignLabelWithHint: true,
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 64, fontWeight: FontWeight.w500, color: Colors.white), // Medium 64
    displayMedium: TextStyle(fontSize: 48, fontWeight: FontWeight.w400, color: Colors.white), // Regular 48
    headlineLarge: TextStyle(fontSize: 36, fontWeight: FontWeight.w700, color: Colors.white), // Bold 36
    headlineMedium: TextStyle(fontSize: 36, fontWeight: FontWeight.w400, color: Colors.white), // Regular 36
    headlineSmall: TextStyle(fontSize: 32, fontWeight: FontWeight.w500, color: Colors.white), // Medium 32
    titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Colors.white), // Bold 24
    titleMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: Colors.white), // Medium 24
    titleSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white), // Semibold 24
    bodySmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white), // Medium 20
    bodyMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: Colors.white), // Medium 20
    labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white), // Regular 16
    labelMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white), // Regular 14
    labelSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white), // Regular 12
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
      foregroundColor: WidgetStateProperty.all(Colors.white),
      textStyle: WidgetStateProperty.all(
        const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, fontFamily: 'Nunito'),
      ),
      backgroundColor: WidgetStateProperty.all(secondary),
      padding: WidgetStateProperty.all(const EdgeInsets.symmetric(vertical: 16)),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
      foregroundColor: WidgetStateProperty.all(Colors.white),
      textStyle: WidgetStateProperty.all(
        const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, fontFamily: 'Nunito'),
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: const Color(0xFF4FE4FE),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      textStyle: const TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w700,
      ),
    ),
  ),
);
