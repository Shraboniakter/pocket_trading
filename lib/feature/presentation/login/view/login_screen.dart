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
    final size = MediaQuery.of(context).size;
    final double screenHeight = size.height;
    final double screenWidth = size.width;

    return Scaffold(
      backgroundColor: ColorManager.bg,
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenHeight,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: screenHeight * 0.7,
                width: screenWidth,
                decoration: const BoxDecoration(
                  color: ColorManager.blue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: SafeArea(
                  child: Column(
                    children: [
                      SizedBox(height: screenHeight * 0.05),

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

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          children: [
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
                              onTap: (){
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
                    ],
                  ),
                ),
              ),

              Positioned(
                top: (screenHeight * 0.7) - 35,
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
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),

              Positioned(
                bottom: 40,
                child: Row(
                  children: const [
                    CustomText(
                      text: "Don’t have an account?",
                      size: 16,
                      fontWeight: FontWeight.w500,
                      color: ColorManager.gray,
                    ),
                    CustomText(
                      text: " Sign Up",
                      size: 16,
                      fontWeight: FontWeight.w500,
                      color: ColorManager.lightBlue,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
