import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../core/constrants/app_color.dart';
import '../../../../../core/routes/route_name.dart';
import '../../../widgets/CustomDialog.dart';
import '../../../widgets/CustomText.dart';
import '../../../widgets/CustomTextfield.dart';
import '../../../widgets/pimary_bottom.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: ColorManager.blue,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
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
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 28,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  CustomText(
                    text: "Edit Profile",
                    color: Colors.white,
                    size: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextfield(
                textInputAction: TextInputAction.next,
                color: ColorManager.gray,
                hintText: "Name",
                suffix: Icon(Icons.person_2_outlined, color: ColorManager.gray),
              ),
              const SizedBox(height: 15),
              CustomTextfield(
                textInputAction: TextInputAction.next,
                color: ColorManager.gray,
                hintText: "Email Address",
                suffix: Icon(Icons.email_outlined, color: ColorManager.gray),
              ),
              const SizedBox(height: 15),
              CustomTextfield(
                textInputAction: TextInputAction.next,
                color: ColorManager.gray,
                hintText: "Mobile Number",
                suffix: Icon(Icons.phone, color: ColorManager.gray),
              ),
              const SizedBox(height: 15),
              CustomTextfield(
                textInputAction: TextInputAction.next,
                color: ColorManager.gray,
                hintText: "Company",
                suffix: Icon(Icons.business_outlined, color: ColorManager.gray),
              ),
              const SizedBox(height: 15),
              CustomTextfield(
                textInputAction: TextInputAction.done,
                color: ColorManager.gray,
                hintText: "Title",
                suffix: Icon(Icons.badge_outlined, color: ColorManager.gray),
              ),
              const SizedBox(height: 40),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RouteName.changePasswordScreen);
                },
                child: CustomText(
                  text: "Change Password",
                  color: ColorManager.lightBlue,
                  decoration: TextDecoration.underline,
                  decorationColor: ColorManager.lightBlue,
                  size: 16,
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                height: 57,
                width: double.infinity,
                child: CustomElevatedBottom(
                  text: "Save",
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
                                  child: CustomBottomDialog(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    width: 335,
                                    height: 342,
                                    buttonText: "Ok",
                                    imagePath: "assets/images/checklist 1.png",
                                    text: "Profile Updated",
                                    description:
                                        "You have successfully updated your profile information.",
                                  ),
                                ),
                              ),
                            );
                          },
                    );
                  },
                  textColor: Colors.white,
                  borderRadius: 16,
                  size: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
