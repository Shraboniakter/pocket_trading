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
      case RouteName.forgotPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => ForgotPasswordScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}
