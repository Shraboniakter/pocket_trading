import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pocket_trading/core/constrants/app_color.dart';
import 'package:pocket_trading/feature/presentation/widgets/CustomText.dart';
import 'bottom.dart';

class CustomBottomDialog extends StatelessWidget {
  final String? text;
  final TextAlign? textAlign;
  final String imagePath;
  final String description;
  final String buttonText;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  const CustomBottomDialog({
    super.key,

    required this.text,
    required this.imagePath,
    required this.description,
    required this.buttonText,
    required this.onPressed,
    this.width,
    this.height,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(25.r),
      child: Container(
        width: width,

        padding: EdgeInsets.all(24.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(imagePath),

             SizedBox(height: 10.h),

            if (text != null)
              CustomText(

                text: text!,
                color: Colors.black,
                size: 24.sp,
                fontWeight: FontWeight.bold,
              ),
             SizedBox(height: 5.h),

            CustomText(
              textAlign: textAlign ?? TextAlign.center,
              text: description,
              color: ColorManager.gray,
              size: 18.sp,
              fontWeight: FontWeight.w500,
            ),

            SizedBox(height: 10.h),

            PrimaryButton(
             onTap:  onPressed,
              height: 57.h,
              title: buttonText,
              size: 18.sp,
              width: double.infinity.w,
              textColor: Colors.white,

            ),

          ],
        ),
      ),
    );
  }
}
