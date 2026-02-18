import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constrants/app_color.dart';
import '../../../screen/widgets/CustomDropdown.dart';
import '../../../widgets/CustomDialog.dart';
import '../../../widgets/CustomText.dart';
import '../../../widgets/CustomTextfield.dart';
import '../../../widgets/bottom.dart';
import '../../../widgets/pimary_bottom.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  String? selectedSubject;

  final List<String> subject = [
    "Lorum ipsum",
    "Dolor Sit",
    "Amet Consectetur",
    "Sed Do",
  ];

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
                    text: "Contact Us",
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0.r),
          child: Column(
            children: [
              CustomTextfield(
                textInputAction: TextInputAction.next,
                color: ColorManager.gray,
                hintText: "Name",
                suffix: Icon(
                  Icons.person_2_outlined,
                  color: ColorManager.gray,
                  size: 20.sp,
                ),
              ),
              SizedBox(height: 15.h),
              CustomTextfield(
                textInputAction: TextInputAction.next,
                color: ColorManager.gray,
                hintText: "Email Address",
                suffix: Icon(
                  Icons.email_outlined,
                  color: ColorManager.gray,
                  size: 20.sp,
                ),
              ),
              SizedBox(height: 15.h),
              CustomDropdown(
                color: ColorManager.gray,
                hintText: "Subject",
                value: selectedSubject,
                items: subject,
                onChanged: (value) {
                  setState(() {
                    selectedSubject = value;
                  });
                },
              ),
              SizedBox(height: 15.h),

              CustomTextfield(
                max: 5,
                color: ColorManager.gray,
                hintText: "lorem ipsum dummy text",
              ),
              SizedBox(height: 30.h),

              PrimaryButton(
                onTap: () {
                  showGeneralDialog(
                    context: context,
                    barrierDismissible: true,
                    barrierLabel: "Dismiss",
                    barrierColor: Colors.black.withOpacity(0.4),
                    transitionDuration: const Duration(milliseconds: 300),
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return const SizedBox();
                    },
                    transitionBuilder:
                        (context, animation, secondaryAnimation, child) {
                          return SlideTransition(
                            position: Tween(
                              begin: const Offset(0, 1),
                              end: const Offset(0, 0),
                            ).animate(animation),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: CustomBottomDialog(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },

                                  buttonText: "Ok",
                                  imagePath: "assets/images/checklist 1.png",
                                  text: "Request Sent",
                                  description:
                                      "You have successfully sent your contact us request.",
                                ),
                              ),
                            ),
                          );
                        },
                  );
                },
                height: 57.h,
                title: "Send Code",
                size: 18.sp,
                width: double.infinity.w,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
