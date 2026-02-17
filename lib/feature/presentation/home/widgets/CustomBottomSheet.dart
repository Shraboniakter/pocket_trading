import 'package:flutter/material.dart';
import 'package:pocket_trading/core/constrants/app_color.dart';
import 'package:pocket_trading/feature/presentation/widgets/CustomText.dart';

class CustomBottomSheet extends StatelessWidget {
  final String? text;
  final TextAlign? textAlign;
  final String? imagePath;
  final String description;
  final String leftButtonText;
  final String rightButtonText;
  final VoidCallback onLeftPressed;
  final VoidCallback onRightPressed;
  final double? width;
  final double? height;
  final IconData? icon;

  const CustomBottomSheet({
    super.key,
    required this.text,
    required this.description,
    required this.onLeftPressed,
    required this.onRightPressed,
    this.leftButtonText = 'Yes',
    this.rightButtonText = 'No',
    this.imagePath,
    this.icon,
    this.width,
    this.textAlign,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(28),
      elevation: 0,
      color: Colors.transparent,
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28),
        ),
        child: Column(
          children: [
            Image.asset(imagePath!, width: 93.75, height: 93.75),

            SizedBox(height: 20),

            if (text != null)
              CustomText(
                text: text!,
                color: Colors.black,
                size: 24,
                fontWeight: FontWeight.bold,
              ),

            const SizedBox(height: 10),

            CustomText(
              textAlign: TextAlign.center,
              text: description,
              color: ColorManager.gray,
              size: 16,
              fontWeight: FontWeight.w400,
            ),

            const SizedBox(height: 25),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: onLeftPressed,
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      side: BorderSide(color: ColorManager.gray),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      leftButtonText,
                      style: const TextStyle(
                        color: ColorManager.gray,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: ColorManager.blue.withOpacity(0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: onRightPressed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.lightBlue,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        rightButtonText,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
