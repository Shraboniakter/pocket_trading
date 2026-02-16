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

    final bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
      backgroundColor: ColorManager.bg,

      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
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
                  const SizedBox(height: 80),
                  Image.asset(AssetPaths.loginPage, height: 80),
                  const SizedBox(height: 20),
                  CustomText(
                    text: "Getting Started",
                    size: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 5),
                  CustomText(
                    text: "Let’s Sign In for explore continues",
                    size: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 40),
                  CustomTextfield(
                    color: ColorManager.gray,
                    hintText: "Email Address",
                    suffix: const Icon(
                      Icons.email_outlined,
                      color: ColorManager.gray,
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomTextfield(
                    color: ColorManager.gray,
                    hintText: "Password",
                    suffix: const Icon(
                      Icons.visibility_off_outlined,
                      color: ColorManager.gray,
                    ),
                  ),
                  const SizedBox(height: 30),
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

                  if (isKeyboardVisible) const SizedBox(height: 100),
                ],
              ),
            ),
          ),


          if (!isKeyboardVisible)
            Positioned(
              top: MediaQuery.of(context).size.height * 0.7 - 35,
              left: MediaQuery.of(context).size.width / 2 - 35,
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
                  child: const Icon(Icons.arrow_forward, color: Colors.white, size: 30),
                ),
              ),
            ),


          if (!isKeyboardVisible)
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