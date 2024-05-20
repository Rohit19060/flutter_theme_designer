import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'container_designer/container_designer.dart';
import 'home.dart';
import 'theme_designer/theme_designer.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: <GoRoute>[
    GoRoute(name: 'home', path: '/', builder: (context, state) => const Home(), routes: [
      GoRoute(
        name: 'theme_designer',
        path: 'theme_designer',
        builder: (context, state) => const ThemeDesigner(),
      ),
      GoRoute(
        name: 'container_designer',
        path: 'container_designer',
        builder: (context, state) => const ContainerDesigner(),
      ),
    ]),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text(
        '404 Page Not Found\nNo route defined for ${state.path}',
        textAlign: TextAlign.center,
      ),
    ),
  ),
);
