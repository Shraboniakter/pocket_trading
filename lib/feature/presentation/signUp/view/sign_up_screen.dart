import 'package:flutter/material.dart';

import '../../../../core/constrants/app_color.dart';
import '../../../../core/constrants/app_images.dart';
import '../../../../core/routes/route_name.dart';
import '../../widgets/CustomText.dart';
import '../../widgets/CustomTextfield.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.bg,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.85,
            decoration: const BoxDecoration(
              color: ColorManager.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  Image.asset(AssetPaths.loginPage, height: 80),
                  const SizedBox(height: 20),
                  CustomText(
                    text: "Hi Welcome!",
                    size: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                  SizedBox(height: 5),
                  CustomText(
                    text: "Create a New Account",
                    size: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 30),

                  CustomTextfield(
                    color: ColorManager.gray,
                    hintText: "Full Name",
                    suffix: Icon(
                      Icons.person_2_outlined,
                      color: ColorManager.gray,
                    ),
                  ),
                  const SizedBox(height: 15),
                  CustomTextfield(
                    color: ColorManager.gray,
                    hintText: "Email Address",
                    suffix: Icon(
                      Icons.email_outlined,
                      color: ColorManager.gray,
                    ),
                  ),
                  const SizedBox(height: 15),
                  CustomTextfield(
                    color: ColorManager.gray,
                    hintText: "Mobile Number",
                    suffix: Icon(Icons.phone, color: ColorManager.gray),
                  ),
                  const SizedBox(height: 15),
                  CustomTextfield(
                    color: ColorManager.gray,
                    hintText: "Company",
                    suffix: Icon(
                      Icons.business_outlined,
                      color: ColorManager.gray,
                    ),
                  ),
                  const SizedBox(height: 15),
                  CustomTextfield(
                    color: ColorManager.gray,
                    hintText: "Title",
                    suffix: Icon(
                      Icons.badge_outlined,
                      color: ColorManager.gray,
                    ),
                  ),
                  const SizedBox(height: 15),
                  CustomTextfield(
                    color: ColorManager.gray,
                    hintText: "Password",

                    suffix: Icon(
                      Icons.visibility_off_outlined,
                      color: ColorManager.gray,
                    ),
                  ),
                  const SizedBox(height: 15),
                  CustomTextfield(
                    color: ColorManager.gray,
                    hintText: "Confirm Password",

                    suffix: Icon(
                      Icons.visibility_off_outlined,
                      color: ColorManager.gray,
                    ),
                  ),
                  const SizedBox(height: 15),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (val) {},
                        fillColor: MaterialStateProperty.all(Colors.white),
                        checkColor: Colors.blue,
                      ),
                      const SizedBox(width: 5),
                      Flexible(
                        child: CustomText(
                          text:
                              "I agree to Privacy Policy and \nTerms & Conditions.",
                          size: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),

          // Floating Action Button (Arrow)
          Positioned(
            top: MediaQuery.of(context).size.height * 0.85 - 30,
            left: MediaQuery.of(context).size.width / 2 - 30,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: ColorManager.lightBlue,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RouteName.verifyOptScreen);
                },
                child: Icon(Icons.arrow_forward, color: Colors.white, size: 30),
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Already have an account?",
                    color: ColorManager.gray,
                    size: 16,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RouteName.loginScreen);
                    },
                    child: CustomText(
                      text: " Sign In",
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
