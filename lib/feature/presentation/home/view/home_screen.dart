import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constrants/app_color.dart';
import '../../widgets/CustomAppbar.dart';
import '../../widgets/pimary_bottom.dart';
import '../widgets/PropertyInfoCard.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.bg,
      body: Column(
        children: [
          CustomHomeAppBar(icon: CupertinoIcons.person_alt_circle),

          // Expanded ListView for scrollable cards
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 10),
              children: [
                PropertyInfoCard(
                  actionText: "Buy",
                  onEdit: () => print("Edit tapped!"),
                  onDelete: () => print("Delete tapped!"),
                  propertyDetails: {
                    "Asset Type": "Hotel",
                    "Location": "13th St, New York, NY 10011, USA",
                    "Property Type": "Select Service/Motel",
                    "Room Count": "40 – 75 Rooms",
                    "Price Range": "\$20M – \$100M",
                  },
                ),
                PropertyInfoCard(
                  actionText: "Sell",
                  onEdit: () => print("Edit tapped!"),
                  onDelete: () => print("Delete tapped!"),
                  propertyDetails: {
                    "Asset Type": "Hotel",
                    "Location": "13th St, New York, NY 10011, USA",
                    "Property Type": "Select Service/Motel",
                    "Room Count": "40 – 75 Rooms",
                    "Price Range": "\$20M – \$100M",
                  },
                ),
                PropertyInfoCard(
                  actionText: "Buy",
                  onEdit: () => print("Edit tapped!"),
                  onDelete: () => print("Delete tapped!"),
                  propertyDetails: {
                    "Asset Type": "Restaurant",
                    "Location": "13th St, New York, NY 10011, USA",
                    "Property Type": "Select Service/Motel",
                    "Room Count": "40 – 75 Rooms",
                    "Price Range": "\$20M – \$100M",
                  },
                ),
                PropertyInfoCard(
                  actionText: "Buy",
                  onEdit: () => print("Edit tapped!"),
                  onDelete: () => print("Delete tapped!"),
                  propertyDetails: {
                    "Asset Type": "Hotel",
                    "Location": "13th St, New York, NY 10011, USA",
                    "Property Type": "Select Service/Motel",
                    "Room Count": "40 – 75 Rooms",
                    "Price Range": "\$1 - \$50,000",
                  },
                ),
              ],
            ),
          ),

          // Fixed bottom button
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: SizedBox(
                height: 57,
                width: double.infinity,
                child: CustomElevatedBottom(
                  text: "Add New",
                  onTap: () {},
                  textColor: Colors.white,
                  borderRadius: 16,
                  size: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
