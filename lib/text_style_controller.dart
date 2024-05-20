// import 'package:flutter/material.dart';

// class TextStyleControl extends StatefulWidget {
//   TextStyleControl(
//     this.label, {
//     super.key,
//     required this.style,
//     this.useMobileLayout = false,
//     this.expanded = false,
//     this.maxFontSize = 112.0,
//   })  : color = style.color ?? Colors.black,
//         backgroundColor = style.color ?? Colors.transparent,
//         letterSpacing = style.letterSpacing ?? 1.0,
//         lineHeight = style.height ?? 1.0,
//         wordSpacing = style.wordSpacing ?? 1.0,
//         fontSize = style.fontSize ?? 12.0,
//         decoration = style.decoration ?? TextDecoration.none,
//         decorationStyle = style.decorationStyle ?? TextDecorationStyle.solid,
//         decorationColor = style.decorationColor ?? style.color ?? Colors.black,
//         isBold = style.fontWeight == FontWeight.bold,
//         isItalic = style.fontStyle == FontStyle.italic;
//   final String label;

//   final Color color;

//   final Color backgroundColor;

//   final double fontSize;

//   final double maxFontSize;

//   final double lineHeight;

//   final bool isBold;

//   final bool isItalic;

//   final double letterSpacing;

//   final double wordSpacing;

//   final TextDecoration decoration;

//   final TextDecorationStyle decorationStyle;

//   final Color decorationColor;

//   final TextStyle style;

//   final bool expanded;

//   final bool useMobileLayout;

//   @override
//   TextStyleControlState createState() => TextStyleControlState();
// }

// class TextStyleControlState extends State<TextStyleControl> {

 

//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             Text(
//               widget.label,
//               style: textTheme.titleLarge,
//               textAlign: TextAlign.left,
//             ),
//             IconButton(
//               icon: Icon(
//                   expanded ? Icons.indeterminate_check_box : Icons.add_box),
//               onPressed: toggle,
//               color: Colors.blueGrey.shade600,
//             )
//           ],
//         ),
//         const Divider(),
//       ],
//     );
//   }

//   void toggle() {
//     setState(() {
//       expanded = !expanded;
//     });
//   }
// }

// const _textDecorationStyles = [
//   SelectionItem<TextDecorationStyle>('Solid', TextDecorationStyle.solid),
//   SelectionItem<TextDecorationStyle>('Dashed', TextDecorationStyle.dashed),
//   SelectionItem<TextDecorationStyle>('Dotted', TextDecorationStyle.dotted),
//   SelectionItem<TextDecorationStyle>('Wavy', TextDecorationStyle.wavy),
//   SelectionItem<TextDecorationStyle>('Double', TextDecorationStyle.double),
// ];

// const _textDecorations = [
//   SelectionItem<TextDecoration>('None', TextDecoration.none),
//   SelectionItem<TextDecoration>('underline', TextDecoration.underline),
//   SelectionItem<TextDecoration>('Linethrough', TextDecoration.lineThrough),
//   SelectionItem<TextDecoration>('Overline', TextDecoration.overline),
// ];

// class SelectionItem<T> {
//   const SelectionItem(this.label, this.value);
//   final String label;
//   final T value;
// }

// class PanacheDropdown<D extends SelectionItem> extends StatelessWidget {
//   const PanacheDropdown(
//       {super.key,
//       required this.collection,
//       required this.onValueChanged,
//       required this.selection,
//       this.label = ''});
//   final List<D> collection;

//   final D selection;

//   final String label;
//   final ValueChanged<D> onValueChanged;

//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;
//     return Column(
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.only(top: 2.0, bottom: 8.0),
//           child: Text(
//             label,
//             style: textTheme.titleSmall,
//           ),
//         ),
//         DropdownButton(
//             items: buildItems(style: textTheme.bodyLarge),
//             isDense: true,
//             value: selection,
//             hint: Text(
//               label,
//               style: textTheme.bodyLarge,
//             ),
//             onChanged: (x) {}),
//       ],
//     );
//   }

//   List<DropdownMenuItem<D>> buildItems({TextStyle? style}) => collection
//       .map<DropdownMenuItem<D>>((item) => toDropdownMenuItem(item, style))
//       .toList(growable: false);

//   DropdownMenuItem<D> toDropdownMenuItem(D item, TextStyle? style) =>
//       DropdownMenuItem(
//         value: item,
//         child: Text(item.label, style: style),
//       );
// }
