import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constrants/app_color.dart';
import 'CustomText.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final double? borderRadius;
  final void Function()? onTap;
  final double? width;
  final double? height; // 👈 add this
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final Color? containerColor;
  final Border? border;
  final double? size;
  final Color? textColor;
  final Color? color;

  const PrimaryButton({
    super.key,
    this.borderRadius,
    required this.title,
    required this.onTap,
    this.width,
    this.height, // 👈 add here
    this.padding,
    this.textStyle,
    this.containerColor,
    this.border,
    this.size,
    this.textColor,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 112.w,
        height: height ?? 48.h, // 👈 default height
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
          color: color ?? ColorManager.lightBlue,
          border: border ?? Border.all(color: Colors.transparent),
        ),
        child: Center(
          child: CustomText(
            size: size,
            text: title,
            color: textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
