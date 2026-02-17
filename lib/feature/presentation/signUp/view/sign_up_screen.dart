import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constrants/app_color.dart';
import '../../../../core/constrants/app_images.dart';
import '../../../../core/routes/route_name.dart';
import '../../login/viewModel/auth_provider.dart';
import '../../widgets/CustomText.dart';
import '../../widgets/CustomTextfield.dart';

class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isCreateNewObscure = ref.watch(authProvider).isCreateNewObscure;
    final isCreateReObscure = ref.watch(authProvider).isCreateReObscure;
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: ColorManager.blue,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    final bool isKeyboardVisible =
        MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorManager.bg,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.85,
            decoration: const BoxDecoration(
              color: ColorManager.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: SingleChildScrollView(
              reverse: false,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  Image.asset(AssetPaths.loginPage, height: 80),
                  const SizedBox(height: 20),
                  CustomText(
                    text: "Hi Welcome!",
                    size: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 5),
                  CustomText(
                    text: "Create a New Account",
                    size: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 30),
                  CustomTextfield(
                    textInputAction: TextInputAction.next,
                    color: ColorManager.gray,
                    hintText: "Full Name",
                    suffix: const Icon(
                      Icons.person_2_outlined,
                      color: ColorManager.gray,
                    ),
                  ),
                  const SizedBox(height: 15),
                  CustomTextfield(
                    textInputAction: TextInputAction.next,
                    color: ColorManager.gray,
                    hintText: "Email Address",
                    suffix: const Icon(
                      Icons.email_outlined,
                      color: ColorManager.gray,
                    ),
                  ),
                  const SizedBox(height: 15),
                  CustomTextfield(
                    textInputAction: TextInputAction.next,
                    color: ColorManager.gray,
                    hintText: "Mobile Number",
                    suffix: const Icon(Icons.phone, color: ColorManager.gray),
                  ),
                  const SizedBox(height: 15),
                  CustomTextfield(
                    textInputAction: TextInputAction.next,
                    color: ColorManager.gray,
                    hintText: "Company",
                    suffix: const Icon(
                      Icons.business_outlined,
                      color: ColorManager.gray,
                    ),
                  ),
                  const SizedBox(height: 15),
                  CustomTextfield(
                    textInputAction: TextInputAction.next,
                    color: ColorManager.gray,
                    hintText: "Title",
                    suffix: const Icon(
                      Icons.badge_outlined,
                      color: ColorManager.gray,
                    ),
                  ),
                  const SizedBox(height: 15),
                  CustomTextfield(

                    obscureText: isCreateNewObscure,
                    color: ColorManager.gray,
                    hintText: "Password",
                    suffix: InkWell(
                      onTap: () {
                        ref
                            .read(authProvider.notifier)
                            .toggleCreateNewObscure();
                        log('message');
                      },
                      child: Icon(
                        isCreateNewObscure
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: ColorManager.gray,
                      ),
                    ),
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(height: 15),
                  CustomTextfield(
                    textInputAction: TextInputAction.done,
                    obscureText: isCreateReObscure,
                    color: ColorManager.gray,
                    hintText: "Confirm Password",
                    suffix: InkWell(
                      onTap: () {
                        ref.read(authProvider.notifier).toggleCreateReObscure();
                        log('message');
                      },
                      child: Icon(
                        isCreateReObscure
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: ColorManager.gray,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (val) {},
                        fillColor: MaterialStateProperty.all(Colors.white),
                        checkColor: Colors.blue,
                      ),
                      const SizedBox(width: 5),
                      Flexible(
                        child: CustomText(
                          text:
                              "I agree to Privacy Policy and \nTerms & Conditions.",
                          size: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: isKeyboardVisible ? 120 : 60),
                ],
              ),
            ),
          ),

          if (!isKeyboardVisible) ...[
            Positioned(
              top: MediaQuery.of(context).size.height * 0.85 - 30,
              left: MediaQuery.of(context).size.width / 2 - 30,
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: ColorManager.lightBlue,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RouteName.verifyOptScreen);
                  },
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "Already have an account?",
                      color: ColorManager.gray,
                      size: 16,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RouteName.loginScreen);
                      },
                      child: CustomText(
                        text: " Sign In",
                        color: ColorManager.lightBlue,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
