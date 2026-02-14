import 'package:flutter/material.dart';
import 'package:pocket_trading/feature/presentation/widgets/CustomText.dart';

import '../../../../core/constrants/app_color.dart';
import '../../widgets/CustomTextfield.dart';
import '../../widgets/pimary_bottom.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.bg, // Subtle light grey background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            // Title
            CustomText(
              text: "Forgot Password?",
              size: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),

            const SizedBox(height: 5),
            // Subtitle
            CustomText(
              text: "No worries, we will help you\n    to reset your password.",
              size: 18,
              color: ColorManager.gray,
            ),

            const SizedBox(height: 50),
            // Email Input Field
            CustomTextfield(
              hintText: "Email Address",
              suffix: Icon(Icons.email_outlined, color: ColorManager.gray),
            ),

            const SizedBox(height: 30),
            // Send Code Button
            SizedBox(
              height: 57,
              width: double.infinity,
              child: CustomElevatedBottom(
                text: "Send Code",
                onTap: () {},
                textColor: Colors.white,
                borderRadius: 16,
                size: 18,
              ),
            ),
            const Spacer(),
            // Bottom Sign In Text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: "Remember your password?",
                  size: 16,
                  fontWeight: FontWeight.w500,
                  color: ColorManager.gray,
                ),
                GestureDetector(
                  onTap: () {},
                  child: CustomText(
                    text: " Sign In",
                    size: 16,
                    fontWeight: FontWeight.w500,
                    color: ColorManager.lightBlue,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
