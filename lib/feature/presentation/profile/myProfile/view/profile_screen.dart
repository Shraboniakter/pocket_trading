import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constrants/app_color.dart';
import '../../../../../core/routes/route_name.dart';
import '../../../home/widgets/CustomBottomSheet.dart';
import '../../../widgets/CustomText.dart';
import '../../widgets/ProfileOptionTile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
              padding: const EdgeInsets.symmetric(horizontal: 10),
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
                    text: "My Profile",
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
              ProfileOptionTile(
                title: 'Edit Profile',
                icon: Icons.person_outline_rounded,
                onTap: () {
                  Navigator.pushNamed(context, RouteName.editProfileScreen);
                },
              ),
              ProfileOptionTile(
                title: 'Feedback',
                icon: CupertinoIcons.chat_bubble_2,
                onTap: () {
                  Navigator.pushNamed(context, RouteName.feedBackScreen);
                },
              ),
              ProfileOptionTile(
                title: 'Contact Us',
                icon: CupertinoIcons.group,
                onTap: () {
                  Navigator.pushNamed(context, RouteName.contactScreen);
                },
              ),
              ProfileOptionTile(
                title: 'Privacy Policy',
                icon: Icons.privacy_tip_outlined,
                onTap: () {
                  Navigator.pushNamed(context, RouteName.privacyPolicyScreen);
                },
              ),
              ProfileOptionTile(
                title: 'Terms & Conditions',
                icon: Icons.description_outlined,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RouteName.termsAndConditionsScreen,
                  );
                },
              ),
              ProfileOptionTile(
                title: 'Delete Account',
                icon: Icons.delete_outline,
                onTap: () {
                  Navigator.pushNamed(context, RouteName.deleteAccountScreen);
                },
              ),
              ProfileOptionTile(
                title: 'Sign Out',
                icon: CupertinoIcons.power,
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
                                padding:  EdgeInsets.all(20.r),
                                child: CustomBottomSheet(
                                  text: "Are You Leaving?",
                                  description:
                                      "Are you sure you want to Sign Out from app?",
                                  onLeftPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      RouteName.loginScreen,
                                    );
                                  },

                                  onRightPressed: () {
                                    Navigator.pop(context, true);
                                  },
                                  imagePath: "assets/images/Groupp.png",

                                ),
                              ),
                            ),
                          );
                        },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
