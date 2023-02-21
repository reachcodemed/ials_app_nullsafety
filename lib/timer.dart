import 'dart:async';
import 'package:ials_app_nullsafety/functions.dart';
import 'package:flutter/material.dart';
import 'package:ials_app_nullsafety/globalVariables.dart' as global;

class GlobalTimerService extends ChangeNotifier{
  late Stopwatch _watch;
  Timer? _timer;

  Duration get currentDuration => _currentDuration;
  Duration _currentDuration = Duration.zero;

  bool get isRunning => _timer != null;

  GlobalTimerService() {
    _watch = Stopwatch();
  }

  void globalTimerTick(Timer timer) {
    _currentDuration = _watch.elapsed;

    // notify all listening widgets
    notifyListeners();
  }

  void globalTimerStart() {
    if (_timer != null) return;

    _timer = Timer.periodic(Duration(seconds: 1), globalTimerTick);
    _watch.start();

    notifyListeners();
  }

  void globalTimerStop() {
    _timer?.cancel();
    _timer = null;
    _watch.stop();
    _currentDuration = _watch.elapsed;

    notifyListeners();
  }

  void globalTimerReset() {
    globalTimerStop();
    _watch.reset();
    _currentDuration = Duration.zero;

    notifyListeners();
  }
// source: https://stackoverflow.com/questions/53228993/how-to-implement-persistent-stopwatch-in-flutter
}

class TwoMinuteTimerService extends ChangeNotifier{
  late Stopwatch _watch;
  Timer? _timer;

  Duration get currentDuration => _currentDuration;
  Duration _currentDuration = Duration.zero;

  bool get isRunning => _timer != null;

  TwoMinuteTimerService() {
    _watch = Stopwatch();
  }

  void twoMinuteTimerTick(Timer timer) {
    _currentDuration = _watch.elapsed;



    if(_currentDuration.inSeconds.toInt() == 115)
      {
        playSound('alarm');
      }

    if(_currentDuration.inSeconds.toInt()==120)
      {
        //rhythmButtonActive = true;
        twoMinuteTimerStop();
        twoMinuteTimerReset();
        playSound('rhythmCheck');
        print("Amiodarone +${global.amiodaroneCycle}");
        print("Adrenaline +${global.adrenalineCycle}");

      }

    // notify all listening widgets
    notifyListeners();
  }

  void twoMinuteTimerStart() {
    if (_timer != null) return;

    _timer = Timer.periodic(Duration(seconds: 1), twoMinuteTimerTick);
    _watch.start();

    notifyListeners();
  }

  void twoMinuteTimerStop() {
    _timer?.cancel();
    _timer = null;
    _watch.stop();
    _currentDuration = _watch.elapsed;

    notifyListeners();
  }

  void twoMinuteTimerReset() {
    twoMinuteTimerStop();
    _watch.reset();
    _currentDuration = Duration.zero;

    notifyListeners();
  }
// source: https://stackoverflow.com/questions/53228993/how-to-implement-persistent-stopwatch-in-flutter
}


