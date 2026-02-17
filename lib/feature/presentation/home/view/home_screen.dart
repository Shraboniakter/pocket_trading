import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocket_trading/feature/presentation/home/widgets/CustomBottomSheet.dart';
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

          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 2),
              children: [
                PropertyInfoCard(
                  actionText: "Buy",
                  onEdit: () => print("Edit tapped!"),
                  onDelete: () {
                    showGeneralDialog(
                      context: context,
                      barrierDismissible: true,
                      barrierLabel: "Dismiss",
                      barrierColor: Colors.black.withOpacity(0.4),
                      transitionDuration: const Duration(milliseconds: 300),
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return const SizedBox();
                      },
                      transitionBuilder:
                          (context, animation, secondaryAnimation, child) {
                            return SlideTransition(
                              position: Tween(
                                begin: const Offset(0, 1),
                                end: const Offset(0, 0),
                              ).animate(animation),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: CustomBottomSheet(
                                    text: "Delete Card",
                                    description:
                                        "Are you sure you want to delete this card?",
                                    onLeftPressed: () {},
                                    onRightPressed: () {
                                      Navigator.pop(context, true);
                                    },
                                    imagePath: "assets/images/checklisttt.png",
                                    height: 342,
                                    width: 335,
                                  ),
                                ),
                              ),
                            );
                          },
                    );
                  },
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
                  onDelete: () {
                    showGeneralDialog(
                      context: context,
                      barrierDismissible: true,
                      barrierLabel: "Dismiss",
                      barrierColor: Colors.black.withOpacity(0.4),
                      transitionDuration: const Duration(milliseconds: 300),
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return const SizedBox();
                      },
                      transitionBuilder:
                          (context, animation, secondaryAnimation, child) {
                            return SlideTransition(
                              position: Tween(
                                begin: const Offset(0, 1),
                                end: const Offset(0, 0),
                              ).animate(animation),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: CustomBottomSheet(
                                    text: "Delete Card",
                                    description:
                                        "Are you sure you want to delete this card?",
                                    onLeftPressed: () {},
                                    onRightPressed: () {
                                      Navigator.pop(context, true);
                                    },
                                    imagePath: "assets/images/checklisttt.png",
                                    height: 342,
                                    width: 335,
                                  ),
                                ),
                              ),
                            );
                          },
                    );
                  },
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
                  onDelete: () {
                    showGeneralDialog(
                      context: context,
                      barrierDismissible: true,
                      barrierLabel: "Dismiss",
                      barrierColor: Colors.black.withOpacity(0.4),
                      transitionDuration: const Duration(milliseconds: 300),
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return const SizedBox();
                      },
                      transitionBuilder:
                          (context, animation, secondaryAnimation, child) {
                            return SlideTransition(
                              position: Tween(
                                begin: const Offset(0, 1),
                                end: const Offset(0, 0),
                              ).animate(animation),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: CustomBottomSheet(
                                    text: "Delete Card",
                                    description:
                                        "Are you sure you want to delete this card?",
                                    onLeftPressed: () {},
                                    onRightPressed: () {
                                      Navigator.pop(context, true);
                                    },
                                    imagePath: "assets/images/checklisttt.png",
                                    height: 342,
                                    width: 335,
                                  ),
                                ),
                              ),
                            );
                          },
                    );
                  },
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
                  onDelete: () {
                    showGeneralDialog(
                      context: context,
                      barrierDismissible: true,
                      barrierLabel: "Dismiss",
                      barrierColor: Colors.black.withOpacity(0.4),
                      transitionDuration: const Duration(milliseconds: 300),
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return const SizedBox();
                      },
                      transitionBuilder:
                          (context, animation, secondaryAnimation, child) {
                            return SlideTransition(
                              position: Tween(
                                begin: const Offset(0, 1),
                                end: const Offset(0, 0),
                              ).animate(animation),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: CustomBottomSheet(
                                    text: "Delete Card",
                                    description:
                                        "Are you sure you want to delete this card?",
                                    onLeftPressed: () {},
                                    onRightPressed: () {
                                      Navigator.pop(context, true);
                                    },
                                    imagePath: "assets/images/checklisttt.png",
                                    height: 342,
                                    width: 335,
                                  ),
                                ),
                              ),
                            );
                          },
                    );
                  },
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

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
