import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pocket_trading/feature/presentation/widgets/CustomTextfield.dart';

import '../../../../core/constrants/app_color.dart';
import '../../../../core/routes/route_name.dart';


import '../../widgets/CustomText.dart';
import '../../widgets/bottom.dart';
import '../viewModel/form_provider.dart';
import '../widgets/CustomDropdown.dart';

class LocationScreen extends ConsumerStatefulWidget {
  const LocationScreen({super.key});

  @override
  ConsumerState<LocationScreen> createState() =>
      _LocationScreenState();
}

class _LocationScreenState
    extends ConsumerState<LocationScreen> {

  String? selectedCountry;

  final TextEditingController stateController =
  TextEditingController();
  final TextEditingController cityController =
  TextEditingController();

  final List<String> countries = [
    "Bangladesh",
    "Korea",
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
          icon: Icon(Icons.arrow_back,
              color: Colors.black, size: 28.sp),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: ColorManager.bg,
        surfaceTintColor: ColorManager.bg,
        automaticallyImplyLeading: false,
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

              /// Country Dropdown
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

              /// State Field
              CustomTextfield(
                controller: stateController,
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

              /// City Field
              CustomTextfield(
                controller: cityController,
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

              SizedBox(height: 200.h),

              /// NEXT BUTTON
              PrimaryButton(
                onTap: () {

                  final form = ref.read(propertyFormProvider);

                  /// Save Location Data
                  form.country = selectedCountry ?? "";
                  form.state = stateController.text;
                  form.city = cityController.text;

                  /// Navigate based on Asset Type
                  if (form.assetType == "Hotel") {
                    Navigator.pushNamed(
                        context,
                        RouteName.ifHotelIsSelectedScreen);
                  } else {
                    Navigator.pushNamed(
                        context,
                        RouteName.ifRestaurantIsSelectedScreen);
                  }
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