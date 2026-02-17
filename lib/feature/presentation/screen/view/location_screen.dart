import 'package:flutter/material.dart';
import 'package:pocket_trading/feature/presentation/widgets/CustomTextfield.dart';

import '../../../../core/constrants/app_color.dart';
import '../../../../core/routes/route_name.dart';
import '../../widgets/CustomText.dart';
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
            children: [
              CustomText(
                text: "Location",
                color: Colors.black,
                size: 24,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 5),
              CustomText(
                text: "lorem ipsum dummy text",
                color: ColorManager.gray,
                size: 18,
              ),
              SizedBox(height: 40),
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
              SizedBox(height: 15),
              CustomTextfield(
                textInputAction: TextInputAction.next,
                color: ColorManager.gray,
                hintText: "State",
                suffix: Icon(Icons.flag_outlined, color: ColorManager.gray),
              ),
              SizedBox(height: 15),
              CustomTextfield(
                textInputAction: TextInputAction.done,
                color: ColorManager.gray,
                hintText: "City",
                suffix: Icon(
                  Icons.location_city_outlined,
                  color: ColorManager.gray,
                ),
              ),
              SizedBox(height: 30),
              InkWell(
                onTap: () {},
                child: CustomText(
                  text: "+ Add City",
                  color: ColorManager.lightBlue,
                  decoration: TextDecoration.underline,
                  decorationColor: ColorManager.lightBlue,
                  size: 16,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top:318),
                child: SizedBox(
                  height: 57,
                  width: double.infinity,
                  child: CustomElevatedBottom(
                    text: "Next",
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RouteName.ifHotelIsSelectedScreen,
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
