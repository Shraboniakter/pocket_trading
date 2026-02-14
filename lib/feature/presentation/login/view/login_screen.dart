import 'package:flutter/material.dart';
import 'package:pocket_trading/core/constrants/app_images.dart';
import 'package:pocket_trading/feature/presentation/widgets/CustomText.dart';
import 'package:pocket_trading/feature/presentation/widgets/CustomTextfield.dart';
import '../../../../core/constrants/app_color.dart';
import '../../../../core/routes/route_name.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.bg,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            decoration: const BoxDecoration(
              color: ColorManager.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  SizedBox(height: 80),

                  Image.asset(AssetPaths.loginPage, height: 80),
                  const SizedBox(height: 20),
                  CustomText(
                    text: "Getting Started",
                    size: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                  SizedBox(height: 5),
                  CustomText(
                    text: "Let’s Sign In for explore continues",
                    size: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 40),

                  CustomTextfield(
                    hintText: "Email Address",
                    suffix: Icon(
                      Icons.email_outlined,
                      color: ColorManager.gray,
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomTextfield(
                    hintText: "Password",
                    suffix: Icon(
                      Icons.visibility_off_outlined,
                      color: ColorManager.gray,
                    ),
                  ),
                  SizedBox(height: 30),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RouteName.forgotPasswordScreen,
                      );
                    },
                    child: CustomText(
                      text: "Forgot Password?",
                      size: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: MediaQuery.of(context).size.height * 0.6 - 35,
            left: MediaQuery.of(context).size.width / 2 - 30,
            // top: (screenHeight * 0.7) - 35,
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: const Color(0xFF00ACEE),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RouteName.homeScreen);
                },
                child: Icon(Icons.arrow_forward, color: Colors.white, size: 30),
              ),
            ),
          ),

          // Sign In Text at bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Don’t have an account?",
                    color: ColorManager.gray,
                    size: 16,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RouteName.signUpScreen);
                    },
                    child: CustomText(
                      text: " Sign Up",
                      color: ColorManager.lightBlue,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
