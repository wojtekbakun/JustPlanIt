import 'package:calend/core/constants/decorations.dart';
import 'package:calend/core/utils/step_date.dart';
import 'package:calend/core/utils/step_radio.dart';
import 'package:calend/presentation/widgets/tiles/tile_steps/tile_seteps_content/single_event_point.dart';
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
      decoration: AppDecorations.lightContainerDecoration,
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
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: steps?.isEmpty == true
                  ? Text(
                      'No events yet',
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  : ListView.builder(
                      itemCount: steps!.length,
                      //shrinkWrap: true,
                      // physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          context.read<RadioStep>().selectStep(index);
                        },
                        // child: SingleStepPoint(
                        //   title: steps![index].title,
                        //   date: StepDateUtils.getSingleStepDateAndTime(
                        //     steps![index],
                        //   ),
                        //   isFirst: index == 0,
                        //   isLast: index == steps!.length - 1,
                        //   isActive: index == clickedStep,
                        // ),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
