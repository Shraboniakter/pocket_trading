import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constrants/app_color.dart';
import '../../../../core/routes/route_name.dart';
import '../../screen/viewModel/property_provider.dart';
import '../../widgets/CustomAppbar.dart';
import '../../widgets/bottom.dart';
import '../widgets/PropertyInfoCard.dart';
import '../widgets/CustomBottomSheet.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final properties = ref.watch(propertyProvider);

    return Scaffold(
      backgroundColor: ColorManager.bg,
      body: Column(
        children: [
          CustomHomeAppBar(icon: CupertinoIcons.person_alt_circle),

          /// PROPERTY LIST
          Expanded(
            child: properties.isEmpty
                ? const Center(
                    child: Text(
                      "No Properties Added Yet",
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    itemCount: properties.length,
                    itemBuilder: (context, index) {
                      final property = properties[index];

                      /// Dynamic property map
                      final Map<String, String> details = {
                        "Asset Type": property.assetType ?? "",
                        "Location":
                            "${property.city ?? ""}, ${property.state ?? ""}, ${property.country ?? ""}",
                        if (property.propertyType != null)
                          "Property Type": property.propertyType!,
                        if (property.roomCount != null)
                          "Room Count": property.roomCount!,
                        if (property.hotelFeature != null)
                          "Hotel Features": property.hotelFeature!,
                        if (property.assetProfile != null)
                          "Asset Profile": property.assetProfile!,

                        if (property.marketSegment != null)
                          "Market Segment": property.marketSegment!,

                        if (property.urgency != null)
                          "Urgency": property.urgency!,
                        if (property.lotSize != null)
                          "Lot Size": property.lotSize!,

                        if (property.squareFootage != null)
                          "Square Footage": property.squareFootage!,
                        if (property.seatCount != null)
                          "Seat Count": property.seatCount!,

                        if (property.note != null)
                          "Note": property.note!,
                        if (property.seatCount != null)
                          "Seat Count": property.seatCount!,

                      };

                      return PropertyInfoCard(
                        actionText: property.actionType ?? "",
                        propertyDetails: details,

                        onEdit: () {
                          print("Edit tapped index $index");
                        },

                        onDelete: () {
                          showGeneralDialog(
                            context: context,
                            barrierDismissible: true,
                            barrierLabel: "Dismiss",
                            barrierColor: Colors.black.withOpacity(0.4),
                            transitionDuration: const Duration(
                              milliseconds: 300,
                            ),
                            pageBuilder: (_, __, ___) => const SizedBox(),
                            transitionBuilder: (context, animation, _, child) {
                              return SlideTransition(
                                position: Tween(
                                  begin: const Offset(0, 1),
                                  end: Offset.zero,
                                ).animate(animation),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: EdgeInsets.all(20.r),
                                    child: CustomBottomSheet(
                                      text: "Delete Card",
                                      description:
                                          "Are you sure you want to delete this card?",
                                      imagePath:
                                          "assets/images/checklisttt.png",

                                      onLeftPressed: () {
                                        ref
                                            .read(propertyProvider.notifier)
                                            .deleteProperty(index);
                                        Navigator.pop(context);
                                      },

                                      onRightPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),

      /// ADD NEW BUTTON
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 30),
        child: PrimaryButton(
          onTap: () {
            Navigator.pushNamed(context, RouteName.buyOrSellScreen);
          },
          height: 57.h,
          title: "Add New",
          size: 18.sp,
          width: double.infinity,
          textColor: Colors.white,
        ),
      ),
    );
  }
}
