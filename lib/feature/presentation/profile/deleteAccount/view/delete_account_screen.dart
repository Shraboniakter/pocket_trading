import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constrants/app_color.dart';
import '../../../home/widgets/CustomBottomSheet.dart';
import '../../../widgets/CustomText.dart';
import '../../../widgets/CustomTextfield.dart';
import '../../../widgets/bottom.dart';
import '../../../widgets/pimary_bottom.dart';
import '../widgets/CustomInfoBox.dart';

class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({super.key});

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  int? selectedIndex;

  final List<String> reasons = [
    "I’m using different account",
    "The app isn’t working properly",
    "I’m worried about my privacy",
    "No one replies",
    "Other",
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
              padding:  EdgeInsets.symmetric(horizontal: 10.w),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon:  Icon(
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
                    text: "Delete Account",
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
        padding:  EdgeInsets.all(20.0.r),
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (int i = 0; i < reasons.length; i++) ...[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = i;
                    });
                  },
                  child: CustomInfoBox(
                    text: reasons[i],
                    textColor: ColorManager.gray,
                    isSelected: selectedIndex == i,
                  ),
                ),
                 SizedBox(height: 20.h),
              ],

              if (selectedIndex == 4)
                CustomTextfield(
                  max: 5,

                  color: ColorManager.gray,
                  hintText: "I’m leaving because...",
                ),

              Padding(
                padding: EdgeInsets.only(top: 230.h),

                child: PrimaryButton(
                  onTap: () {
                    showGeneralDialog(
                      context: context,
                      barrierDismissible: true,
                      barrierLabel: "Dismiss",
                      barrierColor: Colors.black.withOpacity(0.4),
                      transitionDuration: const Duration(milliseconds: 450),
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
                              child: CustomBottomSheet(
                                text: "Delete Account",
                                description:
                                "Are you sure you want to delete your account?",
                                onLeftPressed: () {},

                                onRightPressed: () {
                                  Navigator.pop(context, true);
                                },
                                imagePath: "assets/images/Groupop.png",

                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  height: 57.h,
                  title: "Delete My Account",
                  size: 18.sp,
                  width: double.infinity.w,
                  textColor: Colors.white,
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
