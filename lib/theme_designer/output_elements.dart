import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';

class OutputElements extends StatelessWidget {
  const OutputElements({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
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
          Wrap(
            children: [
              ColorContainer(label: 'Brightness', color: colorScheme.brightness == Brightness.light ? Colors.white : Colors.black),
              ColorContainer(label: 'Primary', color: colorScheme.primary),
              ColorContainer(label: 'On Primary', color: colorScheme.onPrimary),
              ColorContainer(label: 'Primary Container', color: colorScheme.primaryContainer),
              ColorContainer(label: 'Primary Container', color: colorScheme.onPrimaryContainer),
              ColorContainer(label: 'Secondary', color: colorScheme.secondary),
              ColorContainer(label: 'OnSecondary', color: colorScheme.onSecondary),
              ColorContainer(label: 'Secondary Container', color: colorScheme.secondaryContainer),
              ColorContainer(label: 'On Secondary Container', color: colorScheme.onSecondaryContainer),
              ColorContainer(label: 'Surface', color: colorScheme.surface),
              ColorContainer(label: 'On Surface', color: colorScheme.onSurface),
              ColorContainer(label: 'Error', color: colorScheme.error),
              ColorContainer(label: 'On Error', color: colorScheme.onError),
              ColorContainer(label: 'ErrorContainer', color: colorScheme.errorContainer),
              ColorContainer(label: 'InversePrimary', color: colorScheme.inversePrimary),
              ColorContainer(label: 'InverseSurface', color: colorScheme.inverseSurface),
              ColorContainer(label: 'OnInverseSurface', color: colorScheme.onInverseSurface),
              ColorContainer(label: 'OnPrimaryFixed', color: colorScheme.onPrimaryFixed),
              ColorContainer(label: 'OnPrimaryFixedVariant', color: colorScheme.onPrimaryFixedVariant),
              ColorContainer(label: 'OnSecondaryFixed', color: colorScheme.onSecondaryFixed),
              ColorContainer(label: 'OnSecondaryFixedVariant', color: colorScheme.onSecondaryFixedVariant),
              ColorContainer(label: 'OnSurface', color: colorScheme.onSurface),
              ColorContainer(label: 'OnSurfaceVariant', color: colorScheme.onSurfaceVariant),
              ColorContainer(label: 'OnTertiary', color: colorScheme.onTertiary),
              ColorContainer(label: 'OnTertiaryContainer', color: colorScheme.onTertiaryContainer),
              ColorContainer(label: 'OnTertiaryFixed', color: colorScheme.onTertiaryFixed),
              ColorContainer(label: 'Outline', color: colorScheme.outline),
              ColorContainer(label: 'OutlineVariant', color: colorScheme.outlineVariant),
              ColorContainer(label: 'OnTertiaryFixedVariant', color: colorScheme.onTertiaryFixedVariant),
              ColorContainer(label: 'PrimaryFixedDim', color: colorScheme.primaryFixedDim),
              ColorContainer(label: 'Scrim', color: colorScheme.scrim),
              ColorContainer(label: 'SecondaryFixedDim', color: colorScheme.secondaryFixedDim),
              ColorContainer(label: 'SurfaceContainer', color: colorScheme.surfaceContainer),
              ColorContainer(label: 'SurfaceContainerHigh', color: colorScheme.surfaceContainerHigh),
              ColorContainer(label: 'SurfaceContainerHighest', color: colorScheme.surfaceContainerHighest),
              ColorContainer(label: 'SurfaceContainerLow', color: colorScheme.surfaceContainerLow),
              ColorContainer(label: 'SurfaceContainerLowest', color: colorScheme.surfaceContainerLowest),
              ColorContainer(label: 'TertiaryFixedDim', color: colorScheme.tertiaryFixedDim),
            ],
          ),
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
            child: Text('Disabled Elevated Button'),
          ),
          OutlinedButton(
            child: const Text('Outlined Button'),
            onPressed: () {},
          ),
          const OutlinedButton(
            onPressed: null,
            child: Text('Disabled Outlined Button'),
          ),
          TextFormField(enabled: false),
          TextFormField(),
        ],
      ),
    );
  }
}

class ColorContainer extends StatelessWidget {
  const ColorContainer({super.key, required this.label, required this.color});
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.all(4.0),
        padding: const EdgeInsets.all(8.0),
        color: color,
        child: Text(
          '#${color.hex} $label',
          style: TextStyle(
            color: color.computeLuminance() > 0.5 ? Colors.black : Colors.white,
          ),
        ),
      );
}
