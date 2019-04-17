class EggTimer {
  final Duration maxTime;

  EggTimerState state = EggTimerState.READY;
  Duration _currentTime = Duration(seconds: 0);

  EggTimer({this.maxTime});

  get currentTime {
    return _currentTime;
  }

  set currentTime(newTime) {
    if (state == EggTimerState.READY) {
      _currentTime = newTime;
    }
  }
}

enum EggTimerState { READY, RUNNING, PAUSED }
