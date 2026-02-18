import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pocket_trading/core/constrants/app_color.dart';
import '../../widgets/CustomText.dart';

class PropertyInfoCard extends StatelessWidget {
  final String actionText;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final Map<String, String> propertyDetails;

  const PropertyInfoCard({
    super.key,
    this.actionText = "Buy",
    this.onEdit,
    this.onDelete,
    required this.propertyDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.all(10.r),
      padding:  EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: ColorManager.primary,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        children: [
          /// Top Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: actionText,
                color: ColorManager.blue,
                size: 18.sp,
                fontWeight: FontWeight.w700,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: onEdit,
                    icon: const Icon(
                      CupertinoIcons.square_pencil,
                      color: ColorManager.lightBlue,
                    ),
                  ),
                  IconButton(
                    onPressed: onDelete,
                    icon: const Icon(
                      CupertinoIcons.delete_simple,
                      color: Color(0xffFF3030),
                    ),
                  ),
                ],
              ),
            ],
          ),

           Divider(height: 25.h),

          ...propertyDetails.entries
              .map((entry) => _infoRow(entry.key, entry.value))
              .toList(),
        ],
      ),
    );
  }

  Widget _infoRow(String title, String value) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(text: title, color: ColorManager.gray, size: 14.sp),
          Flexible(
            child: CustomText(
              text: value,
              color: ColorManager.lightBlue,
              size: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}
