import 'package:calend/utils/step_date.dart';
import 'package:calend/utils/step_radio.dart';
import 'package:calend/widgets/tiles/tile_steps/tile_seteps_content/single_event_point.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TileSteps extends StatelessWidget {
  final List? steps;
  final String? title;
  final int? clickedStep;
  const TileSteps({
    super.key,
    required this.steps,
    required this.title,
    required this.clickedStep,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 480,
      width: 320,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
              color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.2),
              offset: const Offset(0, 0),
              blurRadius: 10,
              spreadRadius: 4),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                title ?? 'Waiting for events',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),

            //timeline
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: steps?.isEmpty == true
                  ? const Text('No events yet')
                  : ListView.builder(
                      itemCount: steps!.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          context.read<RadioStep>().selectStep(index);
                        },
                        child: SingleStepPoint(
                          title: steps![index].title,
                          date: StepDateUtils.getSingleStepDateAndTime(
                            steps![index],
                          ),
                          isFirst: index == 0,
                          isLast: index == steps!.length - 1,
                          isActive: index == clickedStep,
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
