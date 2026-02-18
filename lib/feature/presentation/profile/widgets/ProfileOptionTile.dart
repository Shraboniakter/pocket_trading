import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pocket_trading/core/constrants/app_color.dart';
import 'package:pocket_trading/feature/presentation/widgets/CustomText.dart';

class ProfileOptionTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const ProfileOptionTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 8.0.h),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20.r),
        child: Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 10.r,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [

              Container(
                padding:  EdgeInsets.all(12.r),
                decoration: BoxDecoration(
                  color: ColorManager.bg,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: ColorManager.lightBlue,
                  size: 22.sp,
                ),
              ),
               SizedBox(width: 16.w),


              Expanded(
                child:CustomText(text: title,size: 16.sp,color: Colors.black,)
              ),


               Icon(
                Icons.arrow_forward_ios_rounded,
                color: Color(0xFF333333),
                size: 18.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}