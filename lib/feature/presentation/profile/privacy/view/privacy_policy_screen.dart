import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constrants/app_color.dart';
import '../../../widgets/CustomText.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.bg,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90.0),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFF0077C0),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(35),
              bottomRight: Radius.circular(35),
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 28.sp,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  CustomText(
                    text: "Privacy Policy",
                    color: Colors.white,
                    size: 22.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0.r),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "Privacy Policy",
                size: 18.sp,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),

              CustomText(
                text: "Last modified : February 05, 2023",
                size: 18.sp,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: 14.h),
              CustomText(
                text: "Introduction",
                size: 18.sp,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: 15.h),
              CustomText(
                text:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                size: 18.sp,
                color: ColorManager.gray,
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 20.h),
              CustomText(
                text:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                size: 18.sp,
                color: ColorManager.gray,
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 14.h),
              CustomText(
                text: "Managing Your Information",
                size: 18.sp,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: 15.h),
              CustomText(
                text:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                size: 18.sp,
                color: ColorManager.gray,
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 20.h),
              CustomText(
                text:
                    "It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                size: 18.sp,
                color: ColorManager.gray,
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 20.h),
              CustomText(
                text:
                    "It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                size: 18.h,
                color: ColorManager.gray,
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
