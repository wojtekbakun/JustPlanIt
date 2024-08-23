import 'package:calend/presentation/widgets/tiles/tile_event/tile_event.dart';
import 'package:calend/presentation/widgets/tiles/tile_prompt/tile_prompt.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: const Column(
          children: [
            TilePrompt(),
            TileEvent(
              title: 'Hello',
            ),
          ],
        ));
  }
}
