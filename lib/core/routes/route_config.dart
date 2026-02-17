part of 'route_import_path.dart';

class AppRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RouteName.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case RouteName.signUpScreen:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case RouteName.verifyOptScreen:
        return MaterialPageRoute(builder: (_) => VerifyOptScreen());
      case RouteName.forgotPasswordScreen:
        return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());
      case RouteName.forgotPasswordOTPScreen:
        return MaterialPageRoute(builder: (_) => ForgotPasswordOtpScreen());
      case RouteName.setNewPasswordScreen:
        return MaterialPageRoute(builder: (_) => SetNewPasswordScreen());
      case RouteName.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case RouteName.profileScreen:
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      case RouteName.assetTypeScreen:
        return MaterialPageRoute(builder: (_) => AssetTypeScreen());
      case RouteName.buyOrSellScreen:
        return MaterialPageRoute(builder: (_) => BuyOrSellScreen());
      case RouteName.locationScreen:
        return MaterialPageRoute(builder: (_) => LocationScreen());
      case RouteName.ifHotelIsSelectedScreen:
        return MaterialPageRoute(builder: (_) => IfHotelIsSelectedScreen());
      case RouteName.ifRestaurantIsSelectedScreen:
        return MaterialPageRoute(
          builder: (_) => IfRestaurantIsSelectedScreen(),
        );
      case RouteName.deleteAccountScreen:
        return MaterialPageRoute(builder: (_) => DeleteAccountScreen());
      case RouteName.editProfileScreen:
        return MaterialPageRoute(builder: (_) => EditProfileScreen());
      case RouteName.changePasswordScreen:
        return MaterialPageRoute(builder: (_) => ChangePasswordScreen());
      case RouteName.privacyPolicyScreen:
        return MaterialPageRoute(builder: (_) => PrivacyPolicyScreen());
      case RouteName.termsAndConditionsScreen:
        return MaterialPageRoute(builder: (_) => TermsAndConditionsScreen());
      case RouteName.feedBackScreen:
        return MaterialPageRoute(builder: (_) => FeedBackScreen());
      case RouteName.contactScreen:
        return MaterialPageRoute(builder: (_) => ContactScreen());

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}
