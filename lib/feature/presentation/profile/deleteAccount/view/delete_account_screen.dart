import 'package:flutter/material.dart';

import '../../../../../core/constrants/app_color.dart';
import '../../../../../core/routes/route_name.dart';
import '../../../home/widgets/CustomBottomSheet.dart';
import '../../../widgets/CustomText.dart';
import '../../../widgets/CustomTextfield.dart';
import '../../../widgets/pimary_bottom.dart';
import '../widgets/CustomInfoBox.dart';

class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({super.key});

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {

  int? selectedIndex;

  final List<String> reasons = [
    "I’m using different account",
    "The app isn’t working properly",
    "I’m worried about my privacy",
    "No one replies",
    "Other",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F9),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90.0),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFF0077C0),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(35),
              bottomRight: Radius.circular(35),
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 28,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  CustomText(
                    text: "Delete Account",
                    color: Colors.white,
                    size: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [

            for (int i = 0; i < reasons.length; i++) ...[
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = i;
                  });
                },
                child: CustomInfoBox(
                  text: reasons[i],
                  textColor: ColorManager.gray,
                  isSelected: selectedIndex == i,
                ),
              ),
              const SizedBox(height: 20),
            ],


            if (selectedIndex == 4)
              CustomTextfield(
                color: ColorManager.gray,
                hintText: "I’m leaving because...",
              ),

            Padding(
              padding: const EdgeInsets.only(top:230),
              child: SizedBox(
                height: 57,
                width: double.infinity,
                child: CustomElevatedBottom(
                  text: "Delete My Account",
                  onTap: () {
                    showGeneralDialog(
                      context: context,
                      barrierDismissible: true,
                      barrierLabel: "Dismiss",
                      barrierColor: Colors.black.withOpacity(0.4),
                      transitionDuration: const Duration(milliseconds: 450),
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
                                text: "Delete Account",
                                description: "Are you sure you want to delete your account?",
                                onLeftPressed: () {
                                  // Navigator.pushNamed(
                                  //     context,
                                  //     RouteName.loginScreen
                                  // );
                                },

                                onRightPressed: () {
                                  Navigator.pop(context, true);
                                },
                                imagePath: "assets/images/Groupop.png",
                                height: 342,
                                width: 335,

                              ),
                            ),
                          ),
                        );
                      },
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
    );
  }
}
