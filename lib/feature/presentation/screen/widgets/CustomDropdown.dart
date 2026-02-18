import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constrants/app_color.dart';

class CustomDropdown extends StatelessWidget {
  final String hintText;
  final Color? color;
  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const CustomDropdown({
    super.key,
    required this.hintText,
    required this.value,
    required this.items,
    required this.onChanged,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      padding:  EdgeInsets.symmetric(horizontal: 16.h),
      decoration: BoxDecoration(
        color:  ColorManager.primary,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          borderRadius:BorderRadius.all(Radius.circular(16.r)),
          alignment: AlignmentDirectional.centerStart,
          menuMaxHeight: 200.h,
          menuWidth: 200.w,

          dropdownColor: ColorManager.primary,
          value: value,
          style:  TextStyle(
            fontSize: 16.sp,
            color: ColorManager.lightBlue,
            fontWeight: FontWeight.w500,
          ),
          hint: Text(
            hintText,
            style: TextStyle(color: color),
          ),
          icon:  Icon(Icons.keyboard_arrow_down,color: ColorManager.gray,size: 20.sp,),
          isExpanded: true,
          items: items.map((item) {
            return DropdownMenuItem<String>(
              // alignment: Alignment.centerRight,
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
