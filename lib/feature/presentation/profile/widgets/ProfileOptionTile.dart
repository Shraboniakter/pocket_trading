import 'package:flutter/material.dart';
import 'package:pocket_trading/core/constrants/app_color.dart';
import 'package:pocket_trading/feature/presentation/widgets/CustomText.dart';

class ProfileOptionTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const ProfileOptionTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              // Left Icon with Light Blue Background
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: ColorManager.bg, // Light background
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: ColorManager.lightBlue,
                  size: 22,
                ),
              ),
              const SizedBox(width: 16),

              // Title Text
              Expanded(
                child:CustomText(text: title,size: 16,color: Colors.black,)
              ),

              // Right Arrow Icon
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Color(0xFF333333),
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}