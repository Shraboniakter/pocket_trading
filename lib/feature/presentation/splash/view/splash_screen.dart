import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constrants/app_images.dart';
import '../../../../core/routes/route_name.dart';
import '../viewModel/riverpod_provider.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();

    ref
        .read(splashTimerProvider)
        .startTimer(
      onFinished: () {
        if (!mounted) return;
        Navigator.pushReplacementNamed(context, RouteName.loginScreen);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F8F9),
      body: Center(
        child: Image.asset(
          AssetPaths.splash,
          width: 187.w,
          height: 196.h,
        ),
      ),
    );

  }
}