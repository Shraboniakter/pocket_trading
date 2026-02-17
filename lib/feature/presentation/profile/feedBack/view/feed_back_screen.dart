import 'package:flutter/material.dart';
import 'package:pocket_trading/feature/presentation/widgets/CustomTextfield.dart';
import 'package:pocket_trading/feature/presentation/widgets/pimary_bottom.dart';
import '../../../../../core/constrants/app_color.dart';
import '../../../screen/widgets/CustomDropdown.dart';
import '../../../widgets/CustomText.dart';

class FeedBackScreen extends StatefulWidget {
  const FeedBackScreen({super.key});

  @override
  State<FeedBackScreen> createState() => _FeedBackScreenState();
}

class _FeedBackScreenState extends State<FeedBackScreen> {
  String? selectedSubject;

  final List<String> subject = [
    "Lorum ipsum",
    "Dolor Sit",
    "Amet Consectetur",
    "Sed Do",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.bg,
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
                    text: "Feedback",
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomDropdown(
                color: ColorManager.gray,
                hintText: "Subject",
                value: selectedSubject,
                items: subject,
                onChanged: (value) {
                  setState(() {
                    selectedSubject = value;
                  });
                },
              ),
              SizedBox(height: 20),
              CustomTextfield(
                hintText: "Tell us what you think....",
                color: ColorManager.gray,
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 57,
                width: double.infinity,
                child: CustomElevatedBottom(
                  text: "Submit",
                  onTap: () {},
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
