import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pocket_trading/feature/presentation/widgets/CustomText.dart';

import '../../../core/constrants/app_color.dart';
import '../../../core/routes/route_name.dart';

class CustomHomeAppBar extends StatelessWidget {
  final IconData ? icon;

  const CustomHomeAppBar({super.key, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 158,
      padding:  EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 25),
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
              SizedBox(height: 10.h),
              CustomText(
                text: "Hello!",
                color: Colors.white,
                size: 26.sp,
                fontWeight: FontWeight.w700,
              ),

              CustomText(
                text: "Imran Hassen",
                color: Colors.white,
                size: 18.sp,
              ),
            ],
          ),

           InkWell(
             onTap: (){
               Navigator.pushNamed(
                 context,
                 RouteName.profileScreen
               );
             },
               child: Icon(icon, color: Colors.white, size: 30.sp)),
        ],
      ),
    );
  }
}
