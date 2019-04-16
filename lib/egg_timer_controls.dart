import 'package:egg_timer/egg_timer_button.dart';
import 'package:flutter/material.dart';

class EggTimerControls extends StatefulWidget {
  @override
  _EggTimerControlsState createState() => _EggTimerControlsState();
}

class _EggTimerControlsState extends State<EggTimerControls> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            EggTimerButton(
              icon: Icons.refresh,
              text: 'RESTART',
            ),
            Expanded(
              child: Container(),
            ),
            EggTimerButton(
              icon: Icons.arrow_back,
              text: 'RESET',
            )
          ],
        ),
        EggTimerButton(
          icon: Icons.pause,
          text: 'PAUSE',
        )
      ],
    );
  }
}
