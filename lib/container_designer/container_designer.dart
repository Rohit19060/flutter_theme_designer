import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../code_preview.dart';
import '../theme_designer/theme_state.dart';
import 'container_editor.dart';
import 'container_states.dart';

class ContainerDesigner extends StatelessWidget {
  const ContainerDesigner({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Container Designer', style: TextStyle(fontSize: 30)),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {},
            ),
          ],
        ),
        body: Row(
          children: [
            const Expanded(
              child: Column(
                children: [
                  Center(child: Text('Container Editor', style: TextStyle(fontSize: 24))),
                  Expanded(child: ContainerEditor()),
                ],
              ),
            ),
            const VerticalDivider(width: 1),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Consumer(
                      builder: (context, ref, child) => Center(
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 100),
                          width: ref.watch(containerWidthState),
                          height: ref.watch(containerHeightState),
                          decoration: ref.watch(decorationNotifierProvider),
                          child: const SizedBox.expand(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Expanded(
                    child: Consumer(
                      builder: (context, ref, child) => CodePreview(
                        str: CustomContainerData(
                          Container(
                            width: ref.watch(containerWidthState),
                            height: ref.watch(containerHeightState),
                            decoration: ref.watch(decorationNotifierProvider),
                            child: const SizedBox.expand(),
                          ),
                          ref.watch(containerWidthState),
                          ref.watch(containerHeightState),
                        ).toString(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
}
