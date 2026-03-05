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
  String? selectedHotelFeatures;
  String? selectedAssetProfile;
  String? selectedMarketSegment;
  String? selectedUrgency;
  String? selectedLotSize;

  final TextEditingController noteController = TextEditingController();

  final List<String> property = [
    "Boutique	",
    "Full Service	",
    "Resort",
    "Extended Stay 	",
    "Limited –Economy",
    "Development Site",
  ];

  final List<String> roomCounts = [
    "Under 40 rooms",
    "40 – 75 Rooms",
    "75 – 150 Rooms",
    "50 – 300 Rooms",
    "51-100 rooms",
    "Over 300 Rooms",
  ];

  final List<String> hotelFeatures = [
    "Beach",
    "Ski",
    "Golf",
    "Spa",
    "Marina",
    "All-Inclusive ",
    "Casino",
    "Meetings focused ",
  ];
  final List<String> assetProfile = [
    "Operating (stabilized)",
    "Operating (value-add)",
    "Repositioning ",
    "Ground-up Development Site",
  ];

  final List<String> marketSegment = [
    "Luxury",
    "Upper Upscale",
    "Upscale",
    "Midscale",
    "Economy",
    "Not sure",
  ];

  final List<String> urgency = ["High", "Medium", " Low"];

  final List<String> lotSize = [
    "Under 1 acre",
    "1 to 2 acres",
    " 2 to 5 acres",
    " 5 to 10 acres",
    "Over 10 acres",
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
                color: Colors.grey,
                hintText: "Select Service",
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
                color: Colors.grey,
                hintText: "Select Menu",
                value: selectedRoomCount,
                items: roomCounts,
                onChanged: (value) {
                  setState(() {
                    selectedRoomCount = value;
                  });
                },
              ),

              SizedBox(height: 20.h),

              CustomText(
                text: "Hotel Features",
                size: 18.sp,
                color: Colors.black,
              ),
              SizedBox(height: 15.h),
              CustomDropdown(
                color: Colors.grey,
                hintText: "Select Menu",
                value: selectedHotelFeatures,
                items: hotelFeatures,
                onChanged: (value) {
                  setState(() {
                    selectedHotelFeatures = value;
                  });
                },
              ),

              SizedBox(height: 20.h),

              CustomText(
                text: " Asset Profile",
                size: 18.sp,
                color: Colors.black,
              ),
              SizedBox(height: 15.h),
              CustomDropdown(
                color: Colors.grey,
                hintText: "Select Menu",
                value: selectedAssetProfile,
                items: assetProfile,
                onChanged: (value) {
                  setState(() {
                    selectedAssetProfile = value;
                  });
                },
              ),

              SizedBox(height: 20.h),

              CustomText(
                text: " Market Segment",
                size: 18.sp,
                color: Colors.black,
              ),
              SizedBox(height: 15.h),
              CustomDropdown(
                color: Colors.grey,
                hintText: "Select Menu",
                value: selectedMarketSegment,
                items: marketSegment,
                onChanged: (value) {
                  setState(() {
                    selectedMarketSegment = value;
                  });
                },
              ),

              SizedBox(height: 20.h),

              CustomText(text: "Urgency", size: 18.sp, color: Colors.black),
              SizedBox(height: 15.h),
              CustomDropdown(
                color: Colors.grey,
                hintText: "Select Menu",
                value: selectedUrgency,
                items: urgency,
                onChanged: (value) {
                  setState(() {
                    selectedUrgency = value;
                  });
                },
              ),
              SizedBox(height: 20.h),

              CustomText(text: "Lot Size", size: 18.sp, color: Colors.black),
              SizedBox(height: 15.h),
              CustomDropdown(
                color: Colors.grey,
                hintText: "Select Menu",
                value: selectedLotSize,
                items: lotSize,
                onChanged: (value) {
                  setState(() {
                    selectedLotSize = value;
                  });
                },
              ),
              SizedBox(height: 20.h),

              /// Note
              CustomText(
                text: "Note",
                size: 18.sp,
                color: Colors.black,
              ),
              SizedBox(height: 15.h),

              CustomTextfield(
                controller: noteController,
                max: 5,
                color: Colors.grey,
                hintText: "",
              ),

              SizedBox(height: 40.h),

              /// SUBMIT BUTTON
              PrimaryButton(
                onTap: () {
                  /// Save to form state
                  form.propertyType = selectedPropertyType;
                  form.roomCount = selectedRoomCount;
                  form.assetProfile = selectedAssetProfile;
                  form.urgency = selectedUrgency;
                  form.marketSegment = selectedMarketSegment;
                  form.hotelFeature = selectedHotelFeatures;
                  form.lotSize = selectedLotSize;

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
                    assetProfile: form.assetProfile,
                    hotelFeature: form.hotelFeature,
                    marketSegment: form.marketSegment,
                    urgency: form.urgency,
                    lotSize: form.lotSize,
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
