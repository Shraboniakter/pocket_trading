import 'package:flutter/material.dart';
import 'package:pocket_trading/core/constrants/app_color.dart';
import 'package:pocket_trading/feature/presentation/widgets/CustomText.dart';
import 'package:pocket_trading/feature/presentation/widgets/pimary_bottom.dart';

import '../../../../core/routes/route_name.dart';
import '../widgets/OptionTile.dart';

class AssetTypeScreen extends StatefulWidget {
  const AssetTypeScreen({super.key});

  @override
  State<AssetTypeScreen> createState() => _AssetTypeScreenState();
}

class _AssetTypeScreenState extends State<AssetTypeScreen> {
  String selectedOption = "Buy";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black, size: 28),
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
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              CustomText(
                text: "Asset Type",
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
              OptionTile(
                title: "BuyRestaurant\n(Second Generation)",
                groupValue: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value;
                  });
                },
              ),
              SizedBox(height: 15),
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
              SizedBox(
                height: 57,
                width: double.infinity,
                child: CustomElevatedBottom(
                  text: "Next",
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteName.locationScreen,
                    );

                  },
                  borderRadius: 16,
                  textColor: Colors.white,
                  size: 18,

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
