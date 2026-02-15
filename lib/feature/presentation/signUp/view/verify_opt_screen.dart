import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/constrants/app_color.dart';
import '../../../../core/routes/route_name.dart';
import '../../widgets/CustomDialog.dart';
import '../../widgets/CustomText.dart';
import '../../widgets/pimary_bottom.dart';

class VerifyOptScreen extends StatelessWidget {
  const VerifyOptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
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
          children: [
            const SizedBox(height: 40),
            // Title
            CustomText(
              text: "OTP Verification",
              size: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),

            const SizedBox(height: 5),
            // Subtitle
            CustomText(
              text:
                  "Enter the verification code we\njust sent to your email address.",
              size: 18,
              color: ColorManager.gray,
            ),
            const SizedBox(height: 40),

            // OTP Input Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildOTPBox(context, first: true),
                _buildOTPBox(context),
                _buildOTPBox(context),
                _buildOTPBox(context, last: true),
              ],
            ),

            const SizedBox(height: 40),
            // Email Info
            CustomText(
              text: "Code was sent to your email",
              size: 16,
              fontWeight: FontWeight.w500,
              color: ColorManager.gray,
            ),
            CustomText(
              text: "alan34@gmail.com",
              size: 16,
              fontWeight: FontWeight.w500,
              color: ColorManager.lightBlue,
            ),

            const SizedBox(height: 40),
            // Verify Button
            SizedBox(
              height: 57,
              width: double.infinity,
              child: CustomElevatedBottom(
                text: "Verify Code",
                onTap: () {
                  showGeneralDialog(
                    context: context,
                    barrierDismissible: true,
                    barrierLabel: "Dismiss",
                    barrierColor: Colors.black.withOpacity(0.4),
                    transitionDuration: const Duration(milliseconds: 300),
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return const SizedBox();
                    },
                    transitionBuilder:
                        (context, animation, secondaryAnimation, child) {
                          return SlideTransition(
                            position: Tween(
                              begin: const Offset(0, 1),
                              end: const Offset(0, 0),
                            ).animate(animation),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: CustomBottomDialog(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      RouteName.buyOrSellScreen,
                                    );
                                  },
                                  width: 335,
                                  height: 425,
                                  buttonText: "Continue",
                                  imagePath: "assets/images/checklist 1.png",
                                  text: "Congratulation",
                                  description:
                                      "Your account has been created successfully.A request has been sent to the admin for verification.You will be able to log in once the admin approves your account.",
                                ),
                              ),
                            ),
                          );
                        },
                  );
                },
                textColor: Colors.white,
                borderRadius: 16,
                size: 18,
              ),
            ),
            const Spacer(),
            // Resend Code Link
            TextButton(
              onPressed: () {},
              child: CustomText(
                text: " Resend Code",
                size: 16,
                fontWeight: FontWeight.w700,
                color: ColorManager.lightBlue,
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // OTP Box Widget
  Widget _buildOTPBox(
    BuildContext context, {
    bool first = false,
    bool last = false,
  }) {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: TextField(
        autofocus: first,
        onChanged: (value) {
          if (value.length == 1 && !last) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty && !first) {
            FocusScope.of(context).previousFocus();
          }
        },
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: const InputDecoration(border: InputBorder.none),
      ),
    );
  }
}
