part of 'route_import_path.dart';

class AppRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case RouteName.loginScreen:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );
      case RouteName.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => SignUpScreen(),
        );
      case RouteName.verifyOptScreen:
        return MaterialPageRoute(
          builder: (_) =>  VerifyOptScreen(),
        );
      case RouteName.forgotPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => ForgotPasswordScreen(),
        );
      case RouteName.forgotPasswordOTPScreen:
        return MaterialPageRoute(
          builder: (_) => ForgotPasswordOtpScreen(),
        );
      case RouteName.setNewPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => SetNewPasswordScreen(),
        );
      case RouteName.homeScreen:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );
      case RouteName.profileScreen:
        return MaterialPageRoute(
          builder: (_) => ProfileScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}
