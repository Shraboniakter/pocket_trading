import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pocket_trading/core/constrants/app_color.dart';
import 'CustomText.dart';

class CustomElevatedBottom extends StatelessWidget {
  const CustomElevatedBottom({
    super.key,
    required this.text,
    required this.onTap,
    this.color,
    this.textColor,
    this.borderRadius,
    this.size,
  });

  final String text;
  final Color? color;
  final Color? textColor;
  final double? borderRadius;
  final VoidCallback onTap;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? ColorManager.lightBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 30.r),
        ),
      ),
      onPressed: onTap,
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 14.0.h),
        child: CustomText(
          size:size ,
          text: text,
          color: textColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
