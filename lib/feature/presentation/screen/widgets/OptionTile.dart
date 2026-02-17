import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pocket_trading/feature/presentation/widgets/CustomText.dart';
import '../../../../core/constrants/app_color.dart';

class OptionTile extends StatelessWidget {
  final String title;
  final String groupValue;
  final ValueChanged<String> onChanged;

  const OptionTile({
    super.key,
    required this.title,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => onChanged(title),
      child: Container(

        padding:  EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: ColorManager.primary,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            CustomText(
              text: title,
              size: 20.sp,
              color: Colors.black,
            ),

            SizedBox(
              height: 60.h,

              child: Radio<String>(
                visualDensity: VisualDensity.compact,
                value: title,
                groupValue: groupValue,
                activeColor: ColorManager.blue,
                onChanged: (value) {
                  if (value != null) {
                    onChanged(value);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
