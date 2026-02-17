import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constrants/app_color.dart';
import '../../../../core/constrants/app_images.dart';
import '../../../../core/routes/route_name.dart';
import '../../widgets/CustomText.dart';
import '../../widgets/CustomTextfield.dart';
import '../viewModel/auth_provider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _formKey.currentState?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoginObscure = ref.watch(authProvider).isLoginObscure;

    final bool isKeyboardVisible =
        MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
      backgroundColor: ColorManager.bg,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            decoration: const BoxDecoration(
              color: ColorManager.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const SizedBox(height: 80),

                  Image.asset(AssetPaths.loginPage, height: 80),

                  const SizedBox(height: 20),

                  CustomText(
                    text: "Getting Started",
                    size: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),

                  const SizedBox(height: 5),

                  CustomText(
                    text: "Let’s Sign In for explore continues",
                    size: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),

                  const SizedBox(height: 40),

                  /// Email
                  CustomTextfield(
                    controller: _emailController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    color: ColorManager.gray,
                    hintText: "Email Address",
                    suffix: const Icon(
                      Icons.email_outlined,
                      color: ColorManager.gray,
                    ),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !EmailValidator.validate(_emailController.text)) {
                        return "Please enter your email address";
                      }else{
                        return null;
                      }
                    },
                  ),

                  const SizedBox(height: 20),

                  /// Password
                  CustomTextfield(
                    controller: _passwordController,
                    textInputAction: TextInputAction.done,
                    obscureText: isLoginObscure,
                    color: ColorManager.gray,
                    hintText: "Password",
                    suffix: InkWell(
                      onTap: () {
                        ref.read(authProvider.notifier).toggleLoginObscure();
                        log('visibility toggled');
                      },
                      child: Icon(
                        isLoginObscure
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: ColorManager.gray,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 8) {
                        return 'Password must be at least 8 characters';
                      } else {
                        return null;
                      }
                    },
                  ),

                  const SizedBox(height: 30),

                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RouteName.forgotPasswordScreen,
                      );
                    },
                    child: CustomText(
                      text: "Forgot Password?",
                      size: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),

                  if (isKeyboardVisible) const SizedBox(height: 100),
                ],
              ),
            ),
          ),

          /// Floating Arrow Button
          if (!isKeyboardVisible)
            Positioned(
              top: MediaQuery.of(context).size.height * 0.7 - 35,
              left: MediaQuery.of(context).size.width / 2 - 35,
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: const Color(0xFF00ACEE),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: InkWell(
                  onTap: () async {

                    Navigator.pushNamed(context, RouteName.homeScreen);
                  },
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),

          /// Bottom SignUp Text
          if (!isKeyboardVisible)
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "Don’t have an account?",
                      color: ColorManager.gray,
                      size: 16,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RouteName.signUpScreen);
                      },
                      child: CustomText(
                        text: " Sign Up",
                        color: ColorManager.lightBlue,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
