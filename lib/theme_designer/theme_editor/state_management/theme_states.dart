import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../theme_state.dart';

final themeState = StateProvider<ThemeData>((ref) => ThemeDesign.values.first.theme);
