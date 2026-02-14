import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocket_trading/feature/presentation/widgets/CustomText.dart';

import '../../../core/constrants/app_color.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 158,
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 25),
      decoration: BoxDecoration(
        color: ColorManager.blue,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              CustomText(
                text: "Hello!",
                color: Colors.white,
                size: 26,
                fontWeight: FontWeight.w700,
              ),

              CustomText(
                text: "Imran Hassen",
                color: Colors.white,
                size: 18,
              ),
            ],
          ),

          const Icon(CupertinoIcons.person_alt_circle, color: Colors.white, size: 30),
        ],
      ),
    );
  }
}
