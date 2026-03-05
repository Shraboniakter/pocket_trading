import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constrants/app_color.dart';
import '../../../../../core/routes/route_name.dart';
import '../../../widgets/CustomDialog.dart';
import '../../../widgets/CustomText.dart';
import '../../../widgets/CustomTextfield.dart';
import '../../../widgets/bottom.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otherTitleController = TextEditingController();

  String? selectedRole;
  final List<String> roles = [
    "Family Office / Investor",
    "Lawyer",
    "Broker/Advisor",
    "Operator/Developer",
    "Other (Free Text Option)",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.bg,
      appBar: _buildAppBar(),
      body: Padding(
        padding: EdgeInsets.all(20.0.r),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [

                CustomTextfield(
                  textInputAction: TextInputAction.next,
                  color: ColorManager.gray,
                  hintText: "Name",
                  suffix: Icon(
                    Icons.person_2_outlined,
                    color: ColorManager.gray,
                    size: 20.sp,
                  ),
                ),
                SizedBox(height: 15.h),

                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: _inputDecoration(
                    "Email Address",
                    Icons.email_outlined,
                  ),
                  validator: (value) {
                    if (value == null ||
                        !value.contains('@') ||
                        !value.contains('.')) {
                      return "The tab has not been correctly filled-in";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15.h),


                TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    _UsNumberFormatter(),
                  ],
                  decoration: _inputDecoration("Mobile Number", Icons.phone),
                  validator: (value) {
                    if (value == null || value.length < 14) {
                      return "Format should be: (XXX)-XXX-XXXX";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15.h),

                // Company Field
                CustomTextfield(
                  textInputAction: TextInputAction.next,
                  color: ColorManager.gray,
                  hintText: "Company",
                  suffix: Icon(
                    Icons.business_outlined,
                    color: ColorManager.gray,
                    size: 20.sp,
                  ),
                ),
                SizedBox(height: 15.h),


                SizedBox(
                  width: 250.w,
                  child: DropdownButtonFormField<String>(

                    menuMaxHeight: 250.h,
                    dropdownColor: ColorManager.primary,

                    value: selectedRole,

                    style: TextStyle(
                      color: ColorManager.lightBlue,
                      fontSize: 14.sp,
                    ),


                    decoration: _inputDecoration(
                      "Title/Role",
                      Icons.badge_outlined,

                    ),


                    items: roles
                        .map(
                          (role) => DropdownMenuItem<String>(
                            value: role,

                            child: Text(
                              role,
                              style: TextStyle(
                                color: ColorManager.lightBlue,
                              ),
                            ),
                          ),
                        )
                        .toList(),

                    onChanged: (value) {
                      setState(() {
                        selectedRole = value;
                      });
                    },


                    icon: const Icon(Icons.arrow_drop_down),
                    elevation: 8,
                  ),
                ),


                if (selectedRole == "Other (Free Text Option)") ...[
                  SizedBox(height: 15.h),
                  CustomTextfield(
                    controller: otherTitleController,
                    hintText: "Specify your role",
                    color: ColorManager.gray,
                  ),
                ],

                SizedBox(height: 40.h),
                _buildChangePasswordLink(),
                SizedBox(height: 40.h),

                PrimaryButton(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      _showSuccessDialog();
                    }
                  },
                  height: 57.h,
                  title: "Update Profile",
                  size: 18.sp,
                  width: double.infinity.w,
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  InputDecoration _inputDecoration(String hint, IconData icon) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: Colors.grey, fontSize: 16.sp),
      filled: true,
      fillColor: ColorManager.primary,
      contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: ColorManager.primary),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: ColorManager.lightBlue),
      ),
      suffixIcon: Icon(icon, color: ColorManager.gray, size: 20.sp),
    );
  }

  // AppBar and other UI methods remains same...
  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
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
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 28.sp,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                CustomText(
                  text: "Edit Profile",
                  color: Colors.white,
                  size: 22.sp,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildChangePasswordLink() {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, RouteName.changePasswordScreen),
      child: CustomText(
        text: "Change Password",
        color: ColorManager.lightBlue,
        decoration: TextDecoration.underline,
        decorationColor: ColorManager.lightBlue,
        size: 16.sp,
      ),
    );
  }

  void _showSuccessDialog() {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Dismiss",
      barrierColor: Colors.black.withOpacity(0.4),
      transitionDuration: const Duration(milliseconds: 450),
      pageBuilder: (_, __, ___) => const SizedBox(),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(0, 1),
            end: const Offset(0, 0),
          ).animate(animation),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: CustomBottomDialog(
                onPressed: () => Navigator.pop(context),
                buttonText: "Ok",
                imagePath: "assets/images/checklist 1.png",
                text: "Profile Updated",
                description:
                    "You have successfully updated your profile information.",
              ),
            ),
          ),
        );
      },
    );
  }
}

// US মোবাইল নম্বর ফরম্যাটার (XXX)-XXX-XXXX
class _UsNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var text = newValue.text;
    if (newValue.selection.baseOffset == 0) return newValue;

    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      if (i == 0) buffer.write('(');
      buffer.write(text[i]);
      if (i == 2) buffer.write(')-');
      if (i == 5) buffer.write('-');
      if (i >= 9) break; // ১০ ডিজিটের বেশি হবে না
    }

    var string = buffer.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(offset: string.length),
    );
  }
}
