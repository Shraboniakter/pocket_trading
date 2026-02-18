import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pocket_trading/core/constrants/app_color.dart';
import 'package:pocket_trading/feature/presentation/widgets/CustomText.dart';

class CustomBottomSheet extends StatelessWidget {
  final String? text;
  final TextAlign? textAlign;
  final String? imagePath;
  final String description;
  final String leftButtonText;
  final String rightButtonText;
  final VoidCallback onLeftPressed;
  final VoidCallback onRightPressed;
  final double? width;
  final double? height;
  final IconData? icon;

  const CustomBottomSheet({
    super.key,
    required this.text,
    required this.description,
    required this.onLeftPressed,
    required this.onRightPressed,
    this.leftButtonText = 'Yes',
    this.rightButtonText = 'No',
    this.imagePath,
    this.icon,
    this.width,
    this.textAlign,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(28.r),
      elevation: 0,
      color: Colors.transparent,
      child: Container(
        width: width,
        height: height,
        padding:  EdgeInsets.all(24.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(imagePath!, width: 93.75.w, height: 93.75.h),

            SizedBox(height: 20.h),

            if (text != null)
              CustomText(
                text: text!,
                color: Colors.black,
                size: 24.sp,
                fontWeight: FontWeight.bold,
              ),

            SizedBox(height: 10.h),

            CustomText(
              textAlign: TextAlign.center,
              text: description,
              color: ColorManager.gray,
              size: 16.sp,
              fontWeight: FontWeight.w400,
            ),

            SizedBox(height: 25.h),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: onLeftPressed,
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      side: BorderSide(color: ColorManager.gray),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      overlayColor: ColorManager.gray.withOpacity(0.1),
                    ),
                    child: Text(
                      leftButtonText,
                      style:  TextStyle(
                        color: ColorManager.gray,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                 SizedBox(width: 12.w),

                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      boxShadow: [
                        BoxShadow(
                          color: ColorManager.blue.withOpacity(0.3),
                          blurRadius: 10.r,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: onRightPressed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.lightBlue,
                        elevation: 0,
                        padding:  EdgeInsets.symmetric(vertical: 16.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        overlayColor: ColorManager.gray.withOpacity(0.1),
                      ),
                      child: Text(
                        rightButtonText,
                        style:  TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
