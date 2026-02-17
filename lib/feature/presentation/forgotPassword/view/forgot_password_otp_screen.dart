import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constrants/app_color.dart';
import '../../../../core/routes/route_name.dart';
import '../../widgets/CustomText.dart';
import '../../widgets/pimary_bottom.dart';

class ForgotPasswordOtpScreen extends StatelessWidget {
  const ForgotPasswordOtpScreen({super.key});

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
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 24.0.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
               SizedBox(height: 40.h),

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

              SizedBox(
                height: 57.h,
                width: double.infinity,
                child: CustomElevatedBottom(
                  text: "Verify Code",
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteName.setNewPasswordScreen,
                    );
                  },
                  textColor: Colors.white,
                  borderRadius: 16.r,
                  size: 18.sp,
                ),
              ),
              SizedBox(height: 280.h),
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
        style:  TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
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
