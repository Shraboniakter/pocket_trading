import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pocket_trading/feature/presentation/widgets/CustomText.dart';

import '../../../../core/constrants/app_color.dart';
import '../../../../core/routes/route_name.dart';
import '../../widgets/CustomTextfield.dart';
import '../../widgets/bottom.dart';
import '../../widgets/pimary_bottom.dart';
import '../widgets/CustomDropdown.dart';

class IfHotelIsSelectedScreen extends StatefulWidget {
  const IfHotelIsSelectedScreen({super.key});

  @override
  State<IfHotelIsSelectedScreen> createState() =>
      _IfHotelIsSelectedScreenState();
}

class _IfHotelIsSelectedScreenState extends State<IfHotelIsSelectedScreen> {
  String? selectedPropertyType;
  String? selectedRoomCount;
  String? selectedPriceRange;

  final List<String> property = [
    "Hotel",
    "Resort",
    "Motel",
    "Boutique Hotel",
    "Luxury Hotel",
  ];

  List<String> roomCounts = [
    "1-5 rooms",
    "6-10 rooms",
    "11-20 rooms",
    "21-50 rooms",
    "51-100 rooms",
    "100+ rooms",
  ];

  List<String> price = [
    "\$1M_\$3M",
    "\$4M_\$6M",
    "\$7M_\$9M",
    "\$10M_\$12M",
    "\$13M_\$15M",
    "\$16M_\$18B",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.bg,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black, size: 28.sp),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "Property Type",
                size: 18.sp,
                color: Colors.black,
              ),
              SizedBox(height: 15.h),
              CustomDropdown(
                color: ColorManager.lightBlue,
                hintText: "Full Service",
                value: selectedPropertyType,
                items: property,
                onChanged: (value) {
                  setState(() {
                    selectedPropertyType = value;
                  });
                },
              ),
              SizedBox(height: 20.h),
              CustomText(text: "Room Count", size: 18.sp, color: Colors.black),
              SizedBox(height: 15.h),
              CustomDropdown(
                color: ColorManager.lightBlue,
                hintText: "Under 40 Rooms",
                value: selectedRoomCount,
                items: roomCounts,
                onChanged: (value) {
                  setState(() {
                    selectedRoomCount = value;
                  });
                },
              ),
              SizedBox(height: 20.h),
              CustomText(text: "Price Range", size: 18.sp, color: Colors.black),
              SizedBox(height: 15.h),

              CustomDropdown(
                color: ColorManager.lightBlue,
                hintText: "\$1M - \$5M",
                value: selectedPriceRange,
                items: price,
                onChanged: (value) {
                  setState(() {
                    selectedPriceRange = value;
                  });
                },
              ),
              SizedBox(height: 20.h),
              CustomText(text: "Note", size: 18.sp, color: Colors.black),
              SizedBox(height: 15.h),

              CustomTextfield(
                max: 5,

                color: ColorManager.lightBlue,
                hintText: "lorem ipsum dummy text",
              ),

              Padding(
                padding: EdgeInsets.only(top: 230.h),
                child: PrimaryButton(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteName.ifRestaurantIsSelectedScreen
                    );
                  },
                  height: 57.h,
                  title: "Submit",
                  size: 18.sp,
                  width: double.infinity.w,
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
