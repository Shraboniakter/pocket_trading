import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocket_trading/core/constrants/app_color.dart';
import 'package:pocket_trading/feature/presentation/widgets/CustomText.dart';

class CustomBottomDialog extends StatelessWidget {
  final String? text;
  final TextAlign? textAlign;
  final String imagePath;
  final String description;
  final String buttonText;
  final VoidCallback onPressed;
  final double? width;
  final double? height;

  const CustomBottomDialog({
    super.key,

    required this.text,
    required this.imagePath,
    required this.description,
    required this.buttonText,
    required this.onPressed,
    this.width,
    this.height,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(imagePath),

            const SizedBox(height: 10),

            if (text != null)
              CustomText(

                text: text!,
                color: Colors.black,
                size: 24,
                fontWeight: FontWeight.bold,
              ),
            const SizedBox(height: 5),

            CustomText(
              textAlign: textAlign ?? TextAlign.center,
              text: description,
              color: ColorManager.gray,
              size: 18,
              fontWeight: FontWeight.w500,
            ),

            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.lightBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: CustomText(
                  text: buttonText,
                  color: Colors.white,
                  size: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
