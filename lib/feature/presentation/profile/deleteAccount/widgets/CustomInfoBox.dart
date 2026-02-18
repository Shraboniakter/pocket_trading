import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pocket_trading/core/constrants/app_color.dart';
import 'package:pocket_trading/feature/presentation/widgets/CustomText.dart';

class CustomInfoBox extends StatelessWidget {
  final String text;
  final double? width;
  final Color? textColor;

  final bool isSelected;

  const CustomInfoBox({
    super.key,
    required this.text,
    this.width,
    this.textColor, required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 57.h,
      width: width ?? double.infinity.w,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: isSelected ? ColorManager.lightBlue : Colors.transparent,
          width: 1.w,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 15.r,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: CustomText(text: text,size: 18.sp,color: textColor,)
    );
  }
}