import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pocket_trading/core/constrants/app_color.dart';

import '../../../../core/routes/route_name.dart';
import '../../widgets/CustomText.dart';
import '../../widgets/bottom.dart';
import '../viewModel/form_provider.dart';
import '../widgets/OptionTile.dart';

class AssetTypeScreen extends ConsumerStatefulWidget {
  const AssetTypeScreen({super.key});

  @override
  ConsumerState<AssetTypeScreen> createState() =>
      _AssetTypeScreenState();
}

class _AssetTypeScreenState
    extends ConsumerState<AssetTypeScreen> {

  String selectedOption = "Hotel";

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
                  ref.read(propertyFormProvider).assetType = selectedOption;
                  Navigator.pushNamed(context, RouteName.locationScreen);
                },
                height: 57.h,
                title: "Next",
                size: 18.sp,
                width: double.infinity.w,
                textColor: Colors.white,

              ),

            ],
          ),
        ),
      ),
    );
  }
}
