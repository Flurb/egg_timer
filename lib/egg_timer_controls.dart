import 'package:egg_timer/egg_timer.dart';
import 'package:egg_timer/egg_timer_button.dart';
import 'package:flutter/material.dart';

class EggTimerControls extends StatefulWidget {
  final eggTimerState;
  final Function() onPause;
  final Function() onResume;
  final Function() onRestart;
  final Function() onReset;

  EggTimerControls(
      {this.eggTimerState,
      this.onPause,
      this.onResume,
      this.onRestart,
      this.onReset});

  @override
  _EggTimerControlsState createState() => _EggTimerControlsState();
}

class _EggTimerControlsState extends State<EggTimerControls>
    with TickerProviderStateMixin {
  AnimationController pauseResumeSlideController;
  AnimationController restartResetFadeController;

  @override
  void initState() {
    super.initState();
    pauseResumeSlideController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 150))
      ..addListener(() => setState(() {}));
    pauseResumeSlideController.value = 1.0;

    restartResetFadeController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 150))
      ..addListener(() => setState(() {}));
    restartResetFadeController.value = 1.0;
  }

  @override
  void dispose() {
    pauseResumeSlideController.dispose();
    restartResetFadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.eggTimerState) {
      case EggTimerState.READY:
        pauseResumeSlideController.forward();
        restartResetFadeController.forward();
        break;
      case EggTimerState.RUNNING:
        pauseResumeSlideController.reverse();
        restartResetFadeController.forward();
        break;
      case EggTimerState.PAUSED:
        pauseResumeSlideController.reverse();
        restartResetFadeController.reverse();
        break;
    }

    return Column(
      children: [
        Opacity(
          opacity: 1.0 - restartResetFadeController.value,
          child: Row(
            children: [
              EggTimerButton(
                icon: Icons.refresh,
                text: 'RESTART',
                onPressed: widget.onRestart,
              ),
              Expanded(
                child: Container(),
              ),
              EggTimerButton(
                icon: Icons.arrow_back,
                text: 'RESET',
                onPressed: widget.onReset,
              )
            ],
          ),
        ),
        Transform(
          transform: Matrix4.translationValues(
              0.0, 100 * pauseResumeSlideController.value, 0.0),
          child: EggTimerButton(
            icon: widget.eggTimerState == EggTimerState.RUNNING
                ? Icons.pause
                : Icons.play_arrow,
            text: widget.eggTimerState == EggTimerState.RUNNING
                ? 'PAUSE'
                : 'RESUME',
            onPressed: widget.eggTimerState == EggTimerState.RUNNING
                ? widget.onPause
                : widget.onResume,
          ),
        )
      ],
    );
  }
}
