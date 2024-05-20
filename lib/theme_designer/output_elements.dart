import 'package:flutter/material.dart';

import 'theme_editor/ui/theme_design_selector.dart';

class OutputElements extends StatelessWidget {
  const OutputElements({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Device Preview'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          Text('displayLarge', style: theme.textTheme.displayLarge),
          Text('displayMedium', style: theme.textTheme.displayMedium),
          Text('displaySmall', style: theme.textTheme.displaySmall),
          Text('headlineLarge', style: theme.textTheme.headlineLarge),
          Text('headlineMedium', style: theme.textTheme.headlineMedium),
          Text('headlineSmall', style: theme.textTheme.headlineSmall),
          Text('titleLarge', style: theme.textTheme.titleLarge),
          Text('titleMedium', style: theme.textTheme.titleMedium),
          Text('titleSmall', style: theme.textTheme.titleSmall),
          Text('bodyLarge', style: theme.textTheme.bodyLarge),
          Text('bodyMedium', style: theme.textTheme.bodyMedium),
          Text('bodySmall', style: theme.textTheme.bodySmall),
          Text('labelLarge', style: theme.textTheme.labelLarge),
          Text('labelMedium', style: theme.textTheme.labelMedium),
          Text('labelSmall', style: theme.textTheme.labelSmall),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            height: 20,
            color: theme.primaryColor,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            height: 20,
            color: theme.colorScheme.secondary,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            height: 20,
            color: theme.colorScheme.error,
          ),
          ElevatedButton(
            child: const Text('Elevated Button'),
            onPressed: () {},
          ),
          const ElevatedButton(
            onPressed: null,
            child: Text('disabled Elevated Button'),
          ),
          OutlinedButton(
            child: const Text('Outlined Button'),
            onPressed: () {},
          ),
          const OutlinedButton(
            onPressed: null,
            child: Text('disabled OutlinedButton Button'),
          ),
          TextFormField(enabled: false),
          TextFormField(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Not registered yet?', style: theme.textTheme.labelMedium),
              TextButton(
                child: Text(
                  'Create an Account',
                  style: theme.textTheme.labelMedium
                      ?.copyWith(color: theme.colorScheme.secondary),
                ),
                onPressed: () {},
              ),
            ],
          ),
          const ThemeDesignSelector(),
        ],
      ),
    );
  }
}
