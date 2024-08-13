import 'package:calend/services/api/http_service.dart';
import 'package:calend/core/utils/step_radio.dart';
import 'package:calend/presentation/widgets/tiles/tile_event/tile_event.dart';
import 'package:calend/presentation/widgets/tiles/tile_single_day/tile_single_day.dart';
import 'package:calend/presentation/widgets/tiles/tile_steps/tile_steps.dart';
import 'package:calend/presentation/widgets/tiles/tile_prompt/tile_prompt.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    ApiService apiService = ApiService(
      baseUrl: 'http://localhost:4000',
    );
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: ElevatedButton(
          onPressed: () async {
            final response =
                await apiService.get('plans/Mastering Apple Pie Baking');
            debugPrint(response.toString());
          },
          child: const Text('Fetch events'),
        ));
  }
}
