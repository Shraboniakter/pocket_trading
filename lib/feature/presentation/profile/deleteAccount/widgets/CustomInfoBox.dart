import 'package:flutter/material.dart';
import 'package:pocket_trading/core/constrants/app_color.dart';
import 'package:pocket_trading/feature/presentation/widgets/CustomText.dart';

class CustomInfoBox extends StatelessWidget {
  final String text;
  final double? width;
  final Color? textColor;

  final bool isSelected;

  const CustomInfoBox({
    super.key,
    required this.text,
    this.width,
    this.textColor, required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 57,
      width: width ?? double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected ? ColorManager.lightBlue : Colors.transparent,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: CustomText(text: text,size: 18,color: textColor,)
    );
  }
}