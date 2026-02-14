import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constrants/app_color.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final int? min;
  final int? max;

  final Widget? suffix;
  final String? Function(String?)? validator;
  final bool? enable;
  final Icon? icon;

  const CustomTextfield({
    super.key,
    this.controller,
    this.hintText,
    this.keyboardType,
    this.obscureText,
    this.textInputAction,
    this.onChanged,
    this.min,
    this.max,
    this.suffix,
    this.validator,
    this.enable,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      obscureText: obscureText ?? false,
      maxLines: obscureText == true ? 1 : max,
      cursorColor: Colors.grey,
      style: const TextStyle(
        color: Color(0xff0085CA),
        fontSize: 16,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.dmSans(

          fontSize: 16.sp,
          color: Colors.grey,
        ),
        prefixIcon: icon,
        suffixIcon: suffix,
        filled: true,
        fillColor: ColorManager.primary,

        // ✅ HEIGHT CONTROL
        isDense: false,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 16,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: ColorManager.primary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: ColorManager.primary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: ColorManager.primary),
        ),
      ),
    );
  }
}
