import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocket_trading/feature/presentation/widgets/CustomText.dart';

import '../../../../core/constrants/app_color.dart';
import '../../../../core/routes/route_name.dart';
import '../../widgets/CustomTextfield.dart';
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
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: "Property Type", size: 18, color: Colors.black),
              SizedBox(height: 15),
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
              SizedBox(height: 20),
              CustomText(text: "Room Count", size: 18, color: Colors.black),
              SizedBox(height: 15),
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
              SizedBox(height: 20),
              CustomText(text: "Price Range", size: 18, color: Colors.black),
              SizedBox(height: 15),

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
                padding: const EdgeInsets.only(top: 230),
                child: SizedBox(
                  height: 57,
                  width: double.infinity,
                  child: CustomElevatedBottom(
                    text: "Submit",
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RouteName.ifRestaurantIsSelectedScreen,
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
