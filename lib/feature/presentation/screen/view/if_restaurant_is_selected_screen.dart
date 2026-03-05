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

class IfRestaurantIsSelectedScreen extends ConsumerStatefulWidget {
  const IfRestaurantIsSelectedScreen({super.key});

  @override
  ConsumerState<IfRestaurantIsSelectedScreen> createState() =>
      _IfRestaurantIsSelectedScreenState();
}

class _IfRestaurantIsSelectedScreenState
    extends ConsumerState<IfRestaurantIsSelectedScreen> {
  String? selectedSquareFootage;
  String? selectedSeatCount;
  String? selectedPriceRange;

  final TextEditingController noteController = TextEditingController();

  final List<String> squareFootage = [
    "100 sq ft",
    "200 sq ft",
    "300 sq ft",
    "400 sq ft",
    "500 sq ft",
    "600 sq ft",
    "700 sq ft",
    "800 sq ft",
    "900 sq ft",
    "1000 sq ft",
    "1500 sq ft",
    "2000 sq ft",
    "2500 sq ft",
    "3000+ sq ft",
  ];

  final List<String> seatCounts = [
    "Under 40",
    "40 - 100",
    "100 - 250",
    " Over 250",
  ];

  final List<String> price = [
    "Under - \$5M",
    "\$5M - \$10M",
    "\$10M - \$20M",
    "\$20M - \$50M",
    "\$50M - \$100M",
    "Over - \$100M",
  ];

  @override
  Widget build(BuildContext context) {
    final form = ref.read(propertyFormProvider);

    return Scaffold(
      backgroundColor: ColorManager.bg,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black, size: 28),
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
              CustomText(text: "Seat Count", size: 18.sp, color: Colors.black),
              SizedBox(height: 15.h),
              CustomDropdown(
                color: Colors.grey,
                hintText: "Select Menu",
                value: selectedSeatCount,
                items: seatCounts,
                onChanged: (value) {
                  setState(() {
                    selectedSeatCount = value;
                  });
                },
              ),

              SizedBox(height: 20.h),

              CustomText(
                text: "Asking Price / Key Money",
                size: 18.sp,
                color: Colors.black,
              ),
              SizedBox(height: 15.h),
              CustomDropdown(
                color: Colors.grey,
                hintText: "Select Menu",
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
                controller: noteController,
                max: 5,
                color: Colors.grey,
                hintText: "Enter note here",
              ),

              SizedBox(height: 40.h),

              PrimaryButton(
                onTap: () {
                  form.squareFootage = selectedSquareFootage;
                  form.seatCount = selectedSeatCount;
                  form.priceRange = selectedPriceRange;
                  form.note = noteController.text;

                  final property = PropertyModel(
                    actionType: form.actionType,
                    assetType: form.assetType,
                    country: form.country,
                    state: form.state,
                    city: form.city,
                    squareFootage: form.squareFootage,
                    seatCount: form.seatCount,
                    priceRange: form.priceRange ?? "",
                    note: form.note,
                  );

                  ref.read(propertyProvider.notifier).addProperty(property);

                  ref.read(propertyFormProvider.notifier).state =
                      PropertyFormState();

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
