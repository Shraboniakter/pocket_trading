import 'package:flutter_riverpod/flutter_riverpod.dart';

/// SplashScreen Timer Provider
final splashTimerProvider = Provider<SplashTimer>((ref) {
  return SplashTimer();
});

class SplashTimer {
  void startTimer({required void Function() onFinished}) {
    Future.delayed(const Duration(seconds: 2), () {
      onFinished();
    });
  }
}