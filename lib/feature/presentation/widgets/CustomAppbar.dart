import 'package:flutter/material.dart';

import '../../../core/constrants/app_color.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 158,
      padding: const EdgeInsets.only(
        top: 50,
        left: 20,
        right: 20,
        bottom: 25,
      ),
      decoration: BoxDecoration(
        color: ColorManager.blue, // Blue color
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
            children: const [
              SizedBox(height: 10,),
              Text(
                "Hello! 👋",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "Imran Hassen",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
            ],
          ),

          const Icon(
            Icons.person_pin,
            color: Colors.white,
            size: 30,
          )
        ],
      ),
    );
  }
}
