import 'dart:async';

import 'package:flutter/material.dart';

class ViewModel extends ChangeNotifier {
  bool _isOnDuty = false;

  // For CountDown
  bool _isLoading = true;
  int _countdown = 20;
  Timer? _timer;

  bool get isOnDuty => _isOnDuty;
  bool get isLoading => _isLoading;
  int get countdown => _countdown;

  setOnDuty(bool isOnDuty) {
    _isOnDuty = isOnDuty;
    notifyListeners();
  }

  void startCountdown() {
    _isLoading = true;
    _countdown = 20;
    notifyListeners();

    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_countdown > 0) {
        _countdown--;
        notifyListeners();
      } else {
        _isLoading = false;
        notifyListeners();
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
