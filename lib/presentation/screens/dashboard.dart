import 'package:calend/core/constants/keys.dart';
import 'package:calend/services/api/api_endpoints.dart';
import 'package:calend/services/api/api_headers.dart';
import 'package:calend/services/api/api_service.dart';
import 'package:calend/core/utils/step_radio.dart';
import 'package:calend/presentation/widgets/tiles/tile_event/tile_event.dart';
import 'package:calend/presentation/widgets/tiles/tile_single_day/tile_single_day.dart';
import 'package:calend/presentation/widgets/tiles/tile_steps/tile_steps.dart';
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
        body: Column(
          children: [
            const TilePrompt(),
            // ElevatedButton(
            //   onPressed: () async {
            //     final response = await apiService.get(
            //       endpoint: ApiEndpoints.getPlanForPie,
            //       headers: ApiHeaders
            //           .onlyBearerHeader, //!TODO remove bearer when auth is implemented
            //     );
            //     debugPrint(response.toString());
            //   },
            //   onLongPress: () async {
            //     Map<String, String> generatePlanBody = {
            //       'userInput':
            //           'I want to learn to flutter programming in 3 days. I have no other plans.'
            //     };

            //     final response = await apiService.post(
            //       endpoint: ApiEndpoints.generatePlan,
            //       body: generatePlanBody,
            //       headers: ApiHeaders
            //           .onlyBearerHeader, //!TODO remove bearer when auth is implemented
            //     );

            //     debugPrint(response.toString());
            //   },
            //   child: const Text('Fetch events'),
            // ),
          ],
        ));
  }
}
