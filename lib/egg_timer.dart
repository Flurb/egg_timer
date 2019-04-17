import 'dart:async';

class EggTimer {
  final Duration maxTime;
  final Function onTimerUpdate;
  EggTimerState state = EggTimerState.READY;
  Duration _currentTime = Duration(seconds: 0);
  Duration lastStartTime = const Duration(seconds: 0);

  final Stopwatch stopwatch = Stopwatch();

  EggTimer({this.maxTime, this.onTimerUpdate});

  get currentTime {
    return _currentTime;
  }

  set currentTime(newTime) {
    if (state == EggTimerState.READY) {
      _currentTime = newTime;
    }
  }

  resume() {
    state = EggTimerState.RUNNING;
    lastStartTime = currentTime;
    stopwatch.start();

    _tick();
  }

  pause() {}

  _tick() {
    print('Current time: ${_currentTime.inSeconds}');
    _currentTime = lastStartTime - stopwatch.elapsed;

    if (_currentTime.inSeconds > 0) {
      Timer(const Duration(seconds: 1), _tick);
    } else {
      state = EggTimerState.READY;
    }

    if (null != onTimerUpdate) {
      onTimerUpdate();
    }
  }
}

enum EggTimerState { READY, RUNNING, PAUSED }
