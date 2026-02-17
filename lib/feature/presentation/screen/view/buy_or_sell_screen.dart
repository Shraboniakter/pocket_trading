import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pocket_trading/core/constrants/app_color.dart';
import 'package:pocket_trading/feature/presentation/widgets/CustomText.dart';
import 'package:pocket_trading/feature/presentation/widgets/pimary_bottom.dart';

import '../../../../core/routes/route_name.dart';
import '../widgets/OptionTile.dart';

class BuyOrSellScreen extends StatefulWidget {
  const BuyOrSellScreen({super.key});

  @override
  State<BuyOrSellScreen> createState() => _BuyOrSellScreenState();
}

class _BuyOrSellScreenState extends State<BuyOrSellScreen> {
  String selectedOption = "Buy";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.bg,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0.r),
          child: Column(
            children: [
              SizedBox(height: 60.h),
              CustomText(
                text: "Looking to Buy or Sell?",
                color: Colors.black,
                size: 24.sp,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 5.h),
              CustomText(
                text: "lorem ipsum dummy text",
                color: ColorManager.gray,
                size: 18.sp,
              ),
              SizedBox(height: 40.h),
              OptionTile(
                title: "Buy",
                groupValue: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value;
                  });
                },
              ),
              SizedBox(height: 15.h),
              OptionTile(
                title: "Sell",
                groupValue: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value;
                  });
                },
              ),
              Spacer(),
              SizedBox(
                height: 57.h,
                width: double.infinity,
                child: CustomElevatedBottom(
                  text: "Next",
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteName.assetTypeScreen,
                    );

                  },
                  borderRadius: 16.r,
                  textColor: Colors.white,
                  size: 18.sp,

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
