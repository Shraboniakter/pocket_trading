import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constrants/app_color.dart';
import '../../../../core/routes/route_name.dart';
import '../../widgets/CustomText.dart';
import '../../widgets/bottom.dart';
import '../viewModel/form_provider.dart';
import '../widgets/CustomDropdown.dart';

class LocationScreen extends ConsumerStatefulWidget {
  const LocationScreen({super.key});

  @override
  ConsumerState<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends ConsumerState<LocationScreen> {
  String? selectedCountry;


  final TextEditingController stateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  final List<String> countries = [
    "United States",
    "Afghanistan",
    "Albania",
    "Algeria",
    "Andorra",
    "Angola",
    "Argentina",
    "Armenia",
    "Australia",
    "Austria",
    "Azerbaijan",
    "Bahamas",
    "Bahrain",
    "Bangladesh",
    "Barbados",
    "Belarus",
    "Belgium",
    "Belize",
    "Benin",
    "Bhutan",
    "Bolivia",
    "Bosnia and Herzegovina",
    "Botswana",
    "Brazil",
    "Brunei",
    "Bulgaria",
    "Cambodia",
    "Cameroon",
    "Canada",
    "Chile",
    "China",
    "Colombia",
    "Costa Rica",
    "Croatia",
    "Cuba",
    "Cyprus",
    "Czech Republic",
    "Denmark",
    "Dominican Republic",
    "Ecuador",
    "Egypt",
    "El Salvador",
    "Estonia",
    "Ethiopia",
    "Fiji",
    "Finland",
    "France",
    "Georgia",
    "Germany",
    "Ghana",
    "Greece",
    "Guatemala",
    "Haiti",
    "Honduras",
    "Hungary",
    "Iceland",
    "India",
    "Indonesia",
    "Iran",
    "Iraq",
    "Ireland",
    "Israel",
    "Italy",
    "Jamaica",
    "Japan",
    "Jordan",
    "Kazakhstan",
    "Kenya",
    "Kuwait",
    "Kyrgyzstan",
    "Laos",
    "Latvia",
    "Lebanon",
    "Libya",
    "Lithuania",
    "Luxembourg",
    "Malaysia",
    "Maldives",
    "Malta",
    "Mexico",
    "Monaco",
    "Mongolia",
    "Morocco",
    "Myanmar",
    "Nepal",
    "Netherlands",
    "New Zealand",
    "Nigeria",
    "Norway",
    "Oman",
    "Pakistan",
    "Panama",
    "Paraguay",
    "Peru",
    "Philippines",
    "Poland",
    "Portugal",
    "Qatar",
    "Romania",
    "Russia",
    "Saudi Arabia",
    "Singapore",
    "South Africa",
    "South Korea",
    "Spain",
    "Sri Lanka",
    "Sweden",
    "Switzerland",
    "Thailand",
    "Turkey",
    "Ukraine",
    "United Arab Emirates",
    "United Kingdom",
    "Uruguay",
    "Uzbekistan",
    "Vatican City",
    "Venezuela",
    "Vietnam",
  ];


  final List<String> statesList = [
    "Alabama",
    "Alaska",
    "Arizona",
    "Arkansas",
    "California",
    "Colorado",
    "Connecticut",
    "Delaware",
    "Florida",
    "Georgia",
    "Hawaii",
    "Idaho",
    "Illinois",
    "Indiana",
    "Iowa",
    "Kansas",
    "Kentucky",
    "Louisiana",
    "Maine",
    "Maryland",
    "Massachusetts",
    "Michigan",
    "Minnesota",
    "Mississippi",
    "Missouri",
    "Montana",
    "Nebraska",
    "Nevada",
    "New Hampshire",
    "New Jersey",
    "New Mexico",
    "New York",
    "North Carolina",
    "North Dakota",
    "Ohio",
    "Oklahoma",
    "Oregon",
    "Pennsylvania",
    "Rhode Island",
    "South Carolina",
    "South Dakota",
    "Tennessee",
    "Texas",
    "Utah",
    "Vermont",
    "Virginia",
    "Washington",
    "West Virginia",
    "Wisconsin",
    "Wyoming",
  ];

  final List<String> citiesList = [
    "New York City",
    "Los Angeles",
    "Chicago",
    "Houston",
    "Phoenix",
    "Philadelphia",
    "San Antonio",
    "San Diego",
    "Dallas",
    "Miami",
    "Orlando",
    "Boston",
    "Atlanta",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.bg,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black, size: 28.sp),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: ColorManager.bg,
        surfaceTintColor: ColorManager.bg,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0.r),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomText(
                text: "Property Location",
                color: Colors.black,
                size: 24.sp,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 40.h),


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
              SizedBox(height: 15.h),


              _buildSearchableField(
                hint: "State",
                controller: stateController,
                options: statesList,
                icon: Icons.map_outlined,
              ),
              SizedBox(height: 15.h),


              _buildSearchableField(
                hint: "City",
                controller: cityController,
                options: citiesList,
                icon: Icons.location_city_outlined,
              ),

              SizedBox(height: 150.h),


              PrimaryButton(
                onTap: () {
                  final form = ref.read(propertyFormProvider);

                  form.country = selectedCountry ?? "";
                  form.state = stateController.text.trim();
                  form.city = cityController.text.trim();

                  if (form.country.isEmpty ||
                      form.state.isEmpty ||
                      form.city.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please fill all fields correctly"),
                      ),
                    );
                    return;
                  }

                  if (form.assetType == "Hotel") {
                    Navigator.pushNamed(
                      context,
                      RouteName.ifHotelIsSelectedScreen,
                    );
                  } else {
                    Navigator.pushNamed(
                      context,
                      RouteName.ifRestaurantIsSelectedScreen,
                    );
                  }
                },
                height: 57.h,
                title: "Next",
                size: 18.sp,
                width: double.infinity.w,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchableField({
    required String hint,
    required TextEditingController controller,
    required List<String> options,
    required IconData icon,
  }) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          return const Iterable<String>.empty();
        }
        return options.where((String option) {
          return option.toLowerCase().contains(
            textEditingValue.text.toLowerCase(),
          );
        });
      },
      onSelected: (String selection) {
        controller.text = selection;
      },
      fieldViewBuilder: (context, fieldController, focusNode, onFieldSubmitted) {

        if (fieldController.text != controller.text) {
          fieldController.text = controller.text;
        }

        return TextField(
          controller: fieldController,
          focusNode: focusNode,
          style: TextStyle(color: ColorManager.lightBlue),
          decoration: InputDecoration(
            filled: true,
            fillColor: ColorManager.primary,
            hintText: hint,
            hintStyle: TextStyle(
              color: ColorManager.gray,
              fontSize: 16.sp,
            ),

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
          ),
          onChanged: (value) {
            controller.text = value;
          },
        );
      },
    );
  }
}
