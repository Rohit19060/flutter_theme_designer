// import 'package:flutter/material.dart';

// const List<String> colors = [
//   'background',
//   'onBackground',
//   'error',
//   'onError',
//   'primary',
//   'primaryVariant',
//   'onPrimary',
//   'secondary',
//   'secondaryVariant',
//   'onSecondary',
//   'surface',
//   'onSurface',
// ];

// enum SchemeColors {
//   background,
//   error,
//   onBackground,
//   onError,
//   onPrimary,
//   onSecondary,
//   onSurface,
//   surface,
//   primary,
//   primaryVariant,
//   secondary,
//   secondaryVariant
// }

// class ColorSchemeControl extends StatelessWidget {
//   const ColorSchemeControl({
//     super.key,
//     required this.scheme,
//     required this.onSchemeChanged,
//   });

//   final ColorScheme scheme;
//   final ValueChanged<ColorScheme> onSchemeChanged;

//   @override
//   Widget build(BuildContext context) {
//     final appTheme = Theme.of(context).textTheme;
//     return Padding(
//       padding: const EdgeInsets.only(top: 16.0),
//       child: Column(
//         children: <Widget>[
//           Text(
//             'Color scheme',
//             style: appTheme.titleLarge,
//           ),
//           GridView.count(
//             shrinkWrap: true,
//             childAspectRatio: 2.8,
//             controller: ScrollController(keepScrollOffset: false),
//             semanticChildCount: colors.length,
//             crossAxisCount: 2,
//           ),
//         ],
//       ),
//     );
//   }

 
//   Color _getSchemeColor(String property, ColorScheme scheme) {
//     final schemeColor = SchemeColors.values
//         .firstWhere((sc) => '$sc'.split('.').last == property);
//     switch (schemeColor) {
//       case SchemeColors.primary:
//         return scheme.primary;
//       case SchemeColors.primaryVariant:
//         return scheme.onPrimaryFixedVariant;
//       case SchemeColors.secondary:
//         return scheme.secondary;
//       case SchemeColors.secondaryVariant:
//         return scheme.onSecondaryFixedVariant;
//       case SchemeColors.background:
//         return scheme.surfaceBright;
//       case SchemeColors.surface:
//         return scheme.surface;
//       case SchemeColors.error:
//         return scheme.error;
//       case SchemeColors.onPrimary:
//         return scheme.onPrimary;
//       case SchemeColors.onSecondary:
//         return scheme.onSecondary;
//       case SchemeColors.onBackground:
//         return scheme.onSurface;
//       case SchemeColors.onSurface:
//         return scheme.onSurface;
//       case SchemeColors.onError:
//         return scheme.onError;
//     }
//   }

//   void _onColorChanged(String property, Color color) {
//     final schemeColor = SchemeColors.values
//         .firstWhere((sc) => '$sc'.split('.').last == property);
//     switch (schemeColor) {
//       case SchemeColors.primary:
//         onSchemeChanged(scheme.copyWith(primary: color));
//         break;
//       case SchemeColors.primaryVariant:
//         onSchemeChanged(scheme.copyWith());
//         break;
//       case SchemeColors.secondary:
//         onSchemeChanged(scheme.copyWith(secondary: color));
//         break;
//       case SchemeColors.secondaryVariant:
//         onSchemeChanged(scheme.copyWith());
//         break;
//       case SchemeColors.background:
//         onSchemeChanged(scheme.copyWith(surface: color));
//         break;
//       case SchemeColors.surface:
//         onSchemeChanged(scheme.copyWith(surface: color));
//         break;
//       case SchemeColors.error:
//         onSchemeChanged(scheme.copyWith(error: color));
//         break;
//       case SchemeColors.onPrimary:
//         onSchemeChanged(scheme.copyWith(onPrimary: color));
//         break;
//       case SchemeColors.onSecondary:
//         onSchemeChanged(scheme.copyWith(onSecondary: color));
//         break;
//       case SchemeColors.onBackground:
//         onSchemeChanged(scheme.copyWith(onSurface: color));
//         break;
//       case SchemeColors.onSurface:
//         onSchemeChanged(scheme.copyWith(onSurface: color));
//         break;
//       case SchemeColors.onError:
//         onSchemeChanged(scheme.copyWith(onError: color));
//         break;
//     }
//   }
// }
