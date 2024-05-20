extension StringExt on String {
  String get toEnumName =>
      split(RegExp('(?=[A-Z])')).map((e) => e.toCapitalized).join(' ');

  String get toCapitalized =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
}
