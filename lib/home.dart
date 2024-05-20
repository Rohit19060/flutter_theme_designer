import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const homeRoutes = [
  ('Container Designer', '/container_designer'),
  ('Theme Designer', '/theme_designer'),
];

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("King's Designer", style: TextStyle(fontSize: 40)),
        ),
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: GridView.builder(
              padding: const EdgeInsets.only(top: 20),
              itemCount: homeRoutes.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300, childAspectRatio: 1.1, crossAxisSpacing: 6, mainAxisSpacing: 6),
              itemBuilder: (context, index) => Card(
                clipBehavior: Clip.antiAlias,
                child: ListTile(
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        homeRoutes[index].$1,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 30, height: 0),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                  onTap: () => context.go(homeRoutes[index].$2),
                ),
              ),
            ),
          ),
        ),
      );
}
