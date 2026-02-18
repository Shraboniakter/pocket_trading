import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constrants/app_color.dart';
import '../../../../core/routes/route_name.dart';
import '../../widgets/CustomDialog.dart';
import '../../widgets/CustomText.dart';
import '../../widgets/bottom.dart';


class VerifyOptScreen extends StatelessWidget {
  const VerifyOptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon:  Icon(Icons.arrow_back, color: Colors.black,size: 20.sp,),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0.r),
        child: SingleChildScrollView(
          child: Column(
            children: [
               SizedBox(height: 40.h),

              CustomText(
                text: "OTP Verification",
                size: 24.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),

               SizedBox(height: 5.h),

              CustomText(
                text:
                    "Enter the verification code we\njust sent to your email address.",
                size: 18.sp,
                color: ColorManager.gray,
              ),
               SizedBox(height: 40.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildOTPBox(context, first: true),
                  _buildOTPBox(context),
                  _buildOTPBox(context),
                  _buildOTPBox(context, last: true),
                ],
              ),

              SizedBox(height: 40.h),

              CustomText(
                text: "Code was sent to your email",
                size: 16.sp,
                fontWeight: FontWeight.w500,
                color: ColorManager.gray,
              ),
              CustomText(
                text: "alan34@gmail.com",
                size: 16.sp,
                fontWeight: FontWeight.w500,
                color: ColorManager.lightBlue,
              ),

               SizedBox(height: 40.h),

              PrimaryButton(
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
                            padding:  EdgeInsets.all(20.r),
                            child: CustomBottomDialog(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  RouteName.buyOrSellScreen,
                                );
                              },
                              width: 335.w,
                              height: 425.h,
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
                height: 57.h,
                title: "Send Code",
                size: 18.sp,
                width: double.infinity.w,
                textColor: Colors.white,

              ),



              SizedBox(height: 250.h),
              TextButton(
                onPressed: () {},
                child: CustomText(
                  text: " Resend Code",
                  size: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: ColorManager.lightBlue,
                ),
              ),
               SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOTPBox(
    BuildContext context, {
    bool first = false,
    bool last = false,
  }) {
    return Container(
      height: 70.h,
      width: 70.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10.r,
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
        style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
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
