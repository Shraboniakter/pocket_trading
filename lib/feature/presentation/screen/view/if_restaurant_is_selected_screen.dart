import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constrants/app_color.dart';
import '../../../../core/routes/route_name.dart';
import '../../widgets/CustomText.dart';
import '../../widgets/CustomTextfield.dart';
import '../../widgets/pimary_bottom.dart';
import '../widgets/CustomDropdown.dart';

class IfRestaurantIsSelectedScreen extends StatefulWidget {
  const IfRestaurantIsSelectedScreen({super.key});

  @override
  State<IfRestaurantIsSelectedScreen> createState() => _IfRestaurantIsSelectedScreenState();
}

class _IfRestaurantIsSelectedScreenState extends State<IfRestaurantIsSelectedScreen> {
  String? selectedSquareFootage;
  String? selectedSeatCount;
  String? selectedPriceRange;

  List<String> squareFootage = [
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
    "3000+ sq ft"
  ];

  List<String> seatCounts = [
    "Single",
    "Double",
    "Triple",
    "Quad / Family",
    "Extra Bed"
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
          icon: const Icon(Icons.arrow_back, color: Colors.black, size: 28),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        surfaceTintColor: ColorManager.bg,

        automaticallyImplyLeading: false,
        backgroundColor: ColorManager.bg,
      ),
      body: Padding(
        padding:  EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: "Square Footage", size: 18, color: Colors.black),
              SizedBox(height: 15),
              CustomDropdown(
                color: ColorManager.lightBlue,
                hintText: "Under 1,000 sf",
                value: selectedSquareFootage,
                items: squareFootage,
                onChanged: (value) {
                  setState(() {
                    selectedSquareFootage= value;
                  });
                },
              ),
              SizedBox(height: 20),
              CustomText(text: "Seat Count", size: 18, color: Colors.black),
              SizedBox(height: 15),
              CustomDropdown(
                color: ColorManager.lightBlue,
                hintText: "40 - 100",
                value: selectedSeatCount,
                items: seatCounts,
                onChanged: (value) {
                  setState(() {
                    selectedSeatCount= value;
                  });
                },
              ),
              SizedBox(height: 20),
              CustomText(text: "Asking Price/Key Money", size: 18, color: Colors.black),
              SizedBox(height: 15),

              CustomDropdown(
                color: ColorManager.lightBlue,
                hintText: "\$1 - \$50,000",
                value: selectedPriceRange,
                items: price,
                onChanged: (value) {
                  setState(() {
                    selectedPriceRange = value;
                  });
                },
              ),
              SizedBox(height: 20),
              CustomText(text: "Note", size: 18, color: Colors.black),
              SizedBox(height: 15),

              CustomTextfield(
                color: ColorManager.lightBlue,
                hintText: "lorem ipsum dummy text",
                suffix: Icon(
                  CupertinoIcons.chat_bubble_text,
                  color: ColorManager.gray,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top:230),
                child: SizedBox(
                  height: 57,
                  width: double.infinity,
                  child: CustomElevatedBottom(
                    text: "Submit",
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RouteName.homeScreen,
                      );

                    },
                    borderRadius: 16,
                    textColor: Colors.white,
                    size: 18,

                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

