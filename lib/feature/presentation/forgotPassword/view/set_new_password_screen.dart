import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constrants/app_color.dart';
import '../../../../core/routes/route_name.dart';
import '../../login/viewModel/auth_provider.dart';
import '../../widgets/CustomDialog.dart';
import '../../widgets/CustomText.dart';
import '../../widgets/CustomTextfield.dart';
import '../../widgets/pimary_bottom.dart';

class SetNewPasswordScreen extends ConsumerWidget {
  const SetNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isNewObscure = ref.watch(authProvider).isNewObscure;
    final isConfirmNewObscure = ref.watch(authProvider).isConfirmNewObscure;
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),

            CustomText(
              text: "Set New Password",
              size: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),

            const SizedBox(height: 5),

            CustomText(
              text: "Must be at least 8 characters.",
              size: 18,
              color: ColorManager.gray,
            ),

            const SizedBox(height: 50),

            CustomTextfield(
              obscureText: isNewObscure,
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
            SizedBox(height: 15),
            CustomTextfield(
              obscureText: isConfirmNewObscure,
              hintText: "Confirm Password",
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
            const SizedBox(height: 30),

            SizedBox(
              height: 57,
              width: double.infinity,
              child: CustomElevatedBottom(
                text: "Reset Password",
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
                                    Navigator.pushNamed(
                                      context,
                                      RouteName.loginScreen,
                                    );
                                  },

                                  width: 335,
                                  height: 342,
                                  buttonText: "Ok",
                                  imagePath: "assets/images/checklist 1.png",
                                  text: "All Done",
                                  description:
                                      "Your password has been reset successfully.",
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
    );
  }
}
