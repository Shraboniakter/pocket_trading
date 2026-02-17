import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocket_trading/core/constrants/app_color.dart';

import '../../../login/viewModel/auth_provider.dart';
import '../../../widgets/CustomDialog.dart';
import '../../../widgets/CustomText.dart';
import '../../../widgets/CustomTextfield.dart';
import '../../../widgets/pimary_bottom.dart';

class ChangePasswordScreen extends ConsumerWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isNewObscure = ref.watch(authProvider).isNewObscure;
    final isConfirmNewObscure = ref.watch(authProvider).isConfirmNewObscure;
    final isCurrentObscure = ref.watch(authProvider).isCurrentObscure;

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
                    text: "Change Password",
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
                obscureText: isCurrentObscure,
                color: ColorManager.gray,
                hintText: "Current Password",

                suffix: InkWell(
                  onTap: () {
                    ref.read(authProvider.notifier).toggleCurrentObscure();
                    log('message');
                  },
                  child: Icon(
                    isCurrentObscure
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: ColorManager.gray,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              CustomTextfield(
                obscureText: isNewObscure,
                color: ColorManager.gray,
                hintText: "New Password",

                suffix: InkWell(
                  onTap: () {
                    ref.read(authProvider.notifier).toggleNewObscure();
                    log('message');
                  },
                  child: Icon(
                    isNewObscure
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: ColorManager.gray,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              CustomTextfield(
                obscureText: isConfirmNewObscure,
                color: ColorManager.gray,
                hintText: "Confirm New Password",

                suffix: InkWell(
                  onTap: () {
                    ref.read(authProvider.notifier).toggleConfirmNewObscure();
                    log('message');
                  },
                  child: Icon(
                    isConfirmNewObscure
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: ColorManager.gray,
                  ),
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                height: 57,
                width: double.infinity,
                child: CustomElevatedBottom(
                  text: "Update",
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
                                    text: "Password Changed!",
                                    description:
                                        "Your password has been changed successfully.",
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
