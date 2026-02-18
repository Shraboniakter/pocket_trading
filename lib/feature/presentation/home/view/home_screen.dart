import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pocket_trading/feature/presentation/home/widgets/CustomBottomSheet.dart';
import '../../../../core/constrants/app_color.dart';

import '../../widgets/CustomAppbar.dart';
import '../../widgets/bottom.dart';

import '../widgets/PropertyInfoCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _onRefresh() async {
    await Future.delayed(const Duration(seconds: 1));

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.bg,
      body: Column(
        children: [
          CustomHomeAppBar(icon: CupertinoIcons.person_alt_circle,),

          Expanded(
            child: RefreshIndicator(
              backgroundColor: Colors.white,
              color: ColorManager.lightBlue,
              onRefresh: _onRefresh,
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
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
                                    padding:  EdgeInsets.all(20.r),
                                    child: CustomBottomSheet(
                                      text: "Delete Card",
                                      description:
                                          "Are you sure you want to delete this card?",
                                      onLeftPressed: () {},
                                      onRightPressed: () {
                                        Navigator.pop(context, true);
                                      },
                                      imagePath:
                                          "assets/images/checklisttt.png",
                                      // height: 342.h,
                                      // width: 335.w,
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
                                    padding: EdgeInsets.all(20.r),
                                    child: CustomBottomSheet(
                                      text: "Delete Card",
                                      description:
                                          "Are you sure you want to delete this card?",
                                      onLeftPressed: () {},
                                      onRightPressed: () {
                                        Navigator.pop(context, true);
                                      },
                                      imagePath:
                                          "assets/images/checklisttt.png",

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
                                    padding:  EdgeInsets.all(20.r),
                                    child: CustomBottomSheet(
                                      text: "Delete Card",
                                      description:
                                          "Are you sure you want to delete this card?",
                                      onLeftPressed: () {},
                                      onRightPressed: () {
                                        Navigator.pop(context, true);
                                      },
                                      imagePath:
                                          "assets/images/checklisttt.png",

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
                                    padding:  EdgeInsets.all(20.r),
                                    child: CustomBottomSheet(
                                      text: "Delete Card",
                                      description:
                                          "Are you sure you want to delete this card?",
                                      onLeftPressed: () {},
                                      onRightPressed: () {
                                        Navigator.pop(context, true);
                                      },
                                      imagePath:
                                          "assets/images/checklisttt.png",

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
          ),

          SafeArea(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
              child: PrimaryButton(
                onTap: () {
                  print("on");
                },
                height: 57.h,
                title: "Add New",
                size: 18.sp,
                width: double.infinity.w,
                textColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
