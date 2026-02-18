import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pocket_trading/feature/presentation/widgets/CustomTextfield.dart';

import '../../../../core/constrants/app_color.dart';
import '../../../../core/routes/route_name.dart';
import '../../widgets/CustomText.dart';
import '../../widgets/bottom.dart';
import '../../widgets/pimary_bottom.dart';
import '../widgets/CustomDropdown.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String? selectedCountry;

  final List<String> countries = [
    "Bangladesh",
    "korea",
    "USA",
    "Canada",
    "Thailand",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.bg,
      appBar: AppBar(
        leading: IconButton(
          icon:Icon(Icons.arrow_back, color: Colors.black, size: 28.sp),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        surfaceTintColor: ColorManager.bg,

        automaticallyImplyLeading: false,
        backgroundColor: ColorManager.bg,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0.r),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomText(
                text: "Location",
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
              CustomDropdown(
                color: ColorManager.gray,
                hintText: "Country",
                value: selectedCountry,
                items: countries,
                onChanged: (value) {
                  setState(() {
                    selectedCountry = value;
                  });
                },
              ),
              SizedBox(height: 15.h),
              CustomTextfield(
                textInputAction: TextInputAction.next,
                color: ColorManager.gray,
                hintText: "State",
                suffix: Icon(
                  Icons.flag_outlined,
                  color: ColorManager.gray,
                  size: 20.sp,
                ),
              ),
              SizedBox(height: 15.h),
              CustomTextfield(
                textInputAction: TextInputAction.done,
                color: ColorManager.gray,
                hintText: "City",
                suffix: Icon(
                  Icons.location_city_outlined,
                  color: ColorManager.gray,
                  size: 20.sp,
                ),
              ),
              SizedBox(height: 30.h),
              InkWell(
                onTap: () {},
                child: CustomText(
                  text: "+ Add City",
                  color: ColorManager.lightBlue,
                  decoration: TextDecoration.underline,
                  decorationColor: ColorManager.lightBlue,
                  size: 16.sp,
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 318.h),
                child: PrimaryButton(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteName.ifHotelIsSelectedScreen,
                    );
                  },
                  height: 57.h,
                  title: "Next",
                  size: 18.sp,
                  width: double.infinity.w,
                  textColor: Colors.white,
                ),
                // SizedBox(
                //   height: 57,
                //   width: double.infinity,
                //   child: CustomElevatedBottom(
                //     text: "Next",
                //     onTap: () {
                //       Navigator.pushNamed(
                //         context,
                //         RouteName.ifHotelIsSelectedScreen,
                //       );
                //     },
                //     borderRadius: 16,
                //     textColor: Colors.white,
                //     size: 18,
                //   ),
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
