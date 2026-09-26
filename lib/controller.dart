import 'dart:async';

import 'package:flutter/material.dart';

enum PomodoroMode { work, shortBreak, longBreak }

class Controller extends ChangeNotifier {
  PomodoroMode _currentMode = PomodoroMode.work;
  int _remainingSeconds = 25 * 60;
  int _totalSeconds = 25 * 60;
  bool _isRunning = false;
  Timer? _timer;

  //* UI Variables
  PomodoroMode get currentMode => _currentMode;
  int get remainingSeconds => _remainingSeconds;
  bool get isRunning => _isRunning;
  bool autoStartSession = true;

  double get progress =>
      _totalSeconds > 0 ? _remainingSeconds / _totalSeconds : 0;

  String get formattedTime {
    final minutes = (_remainingSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (_remainingSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  //* Changes Modes
  void setMode(PomodoroMode newMode) {
    if (newMode == _currentMode) return;
    _timer?.cancel();
    _isRunning = false;
    _currentMode = newMode;
    switch (_currentMode) {
      case PomodoroMode.work:
        _totalSeconds = 25 * 60;
        break;
      case PomodoroMode.shortBreak:
        _totalSeconds = 5 * 60;
        break;
      case PomodoroMode.longBreak:
        _totalSeconds = 15 * 60;
        break;
    }
    _remainingSeconds = _totalSeconds;
    notifyListeners();
  }

  //* Toggle Timer
  void toggleTimer() {
    if (_isRunning) {
      _pauseTimer();
    } else {
      _startTimer();
    }
  }

  //* Start Timer
  void _startTimer() {
    _isRunning = true;
    notifyListeners();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        _remainingSeconds--;
        notifyListeners();
      } else {
        _timer?.cancel();
        _isRunning = false;
        _handleModeChange();
      }
    });
  }

  //* Pause Timer
  void _pauseTimer() {
    _timer?.cancel();
    _isRunning = false;
    notifyListeners();
  }

  //* Automatically Change on Timer End
  void _handleModeChange() {
    if (_currentMode == PomodoroMode.work) {
      setMode(PomodoroMode.shortBreak);
      notifyListeners();
    } else {
      setMode(PomodoroMode.work);
    }
    if (autoStartSession) {
      _startTimer();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
