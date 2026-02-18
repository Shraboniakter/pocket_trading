import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pocket_trading/core/constrants/app_color.dart';
import 'package:pocket_trading/feature/presentation/widgets/CustomText.dart';
import '../../../../core/routes/route_name.dart';
import '../../widgets/bottom.dart';
import '../widgets/OptionTile.dart';

class AssetTypeScreen extends StatefulWidget {
  const AssetTypeScreen({super.key});

  @override
  State<AssetTypeScreen> createState() => _AssetTypeScreenState();
}

class _AssetTypeScreenState extends State<AssetTypeScreen> {
  String selectedOption = "Buy";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black, size: 28.sp),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        automaticallyImplyLeading: false,
        backgroundColor: ColorManager.bg,
      ),
      backgroundColor: ColorManager.bg,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(20.0.r),
          child: Column(
            children: [
              CustomText(
                text: "Asset Type",
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
                title: "BuyRestaurant\n(Second Generation)",
                groupValue: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value;
                  });
                },
              ),
              SizedBox(height: 15.h),
              OptionTile(
                title: "Hotel",
                groupValue: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value;
                  });
                },
              ),
              Spacer(),
              PrimaryButton(
                onTap: () {
                  Navigator.pushNamed(context, RouteName.locationScreen);
                },
                height: 57.h,
                title: "Next",
                size: 18.sp,
                width: double.infinity.w,
                textColor: Colors.white,

              ),
              // SizedBox(
              //   height: 57.h,
              //   width: double.infinity,
              //   child: CustomElevatedBottom(
              //     text: "Next",
              //     onTap: () {
              //       Navigator.pushNamed(context, RouteName.locationScreen);
              //     },
              //     borderRadius: 16.r,
              //     textColor: Colors.white,
              //     size: 18.sp,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
