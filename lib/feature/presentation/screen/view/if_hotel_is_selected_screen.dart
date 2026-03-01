import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constrants/app_color.dart';
import '../../../../core/routes/route_name.dart';
import '../../../../data/property_model.dart';

import '../../widgets/CustomText.dart';
import '../../widgets/CustomTextfield.dart';
import '../../widgets/bottom.dart';
import '../viewModel/form_provider.dart';
import '../viewModel/property_provider.dart';
import '../widgets/CustomDropdown.dart';

class IfHotelIsSelectedScreen extends ConsumerStatefulWidget {
  const IfHotelIsSelectedScreen({super.key});

  @override
  ConsumerState<IfHotelIsSelectedScreen> createState() =>
      _IfHotelIsSelectedScreenState();
}

class _IfHotelIsSelectedScreenState
    extends ConsumerState<IfHotelIsSelectedScreen> {
  String? selectedPropertyType;
  String? selectedRoomCount;
  String? selectedPriceRange;

  final TextEditingController noteController = TextEditingController();

  final List<String> property = [
    "Hotel",
    "Resort",
    "Motel",
    "Boutique Hotel",
    "Luxury Hotel",
  ];

  final List<String> roomCounts = [
    "1-5 rooms",
    "6-10 rooms",
    "11-20 rooms",
    "21-50 rooms",
    "51-100 rooms",
    "100+ rooms",
  ];

  final List<String> price = [
    "\$1M - \$3M",
    "\$4M - \$6M",
    "\$7M - \$9M",
    "\$10M - \$12M",
    "\$13M - \$15M",
    "\$16M - \$18M",
  ];

  @override
  Widget build(BuildContext context) {
    final form = ref.read(propertyFormProvider);

    return Scaffold(
      backgroundColor: ColorManager.bg,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black, size: 28.sp),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Property Type
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

              /// Room Count
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

              /// Price Range
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

              /// Note
              CustomText(text: "Note", size: 18.sp, color: Colors.black),
              SizedBox(height: 15.h),

              CustomTextfield(
                controller: noteController,
                max: 5,
                color: ColorManager.lightBlue,
                hintText: "Enter note here",
              ),

              SizedBox(height: 40.h),

              /// SUBMIT BUTTON
              PrimaryButton(
                onTap: () {
                  /// Save to form state
                  form.propertyType = selectedPropertyType;
                  form.roomCount = selectedRoomCount;
                  form.priceRange = selectedPriceRange;
                  form.note = noteController.text;

                  /// Create PropertyModel
                  final property = PropertyModel(
                    actionType: form.actionType,
                    assetType: form.assetType,
                    country: form.country,
                    state: form.state,
                    city: form.city,
                    propertyType: form.propertyType,
                    roomCount: form.roomCount,
                    priceRange: form.priceRange ?? "",
                    note: form.note,
                  );

                  /// Add to list
                  ref.read(propertyProvider.notifier).addProperty(property);

                  /// Reset form
                  ref.read(propertyFormProvider.notifier).state =
                      PropertyFormState();

                  /// Go back to Home
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    RouteName.homeScreen,
                    (route) => false,
                  );
                },
                height: 57.h,
                title: "Submit",
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
