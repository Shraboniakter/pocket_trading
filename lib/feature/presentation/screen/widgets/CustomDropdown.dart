import 'package:flutter/material.dart';

import '../../../../core/constrants/app_color.dart';

class CustomDropdown extends StatelessWidget {
  final String hintText;
  final Color? color;
  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const CustomDropdown({
    super.key,
    required this.hintText,
    required this.value,
    required this.items,
    required this.onChanged,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color:  ColorManager.primary,
        borderRadius: BorderRadius.circular(15),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(

          dropdownColor: ColorManager.primary,
          value: value,
          hint: Text(
            hintText,
            style: TextStyle(color: color),
          ),
          icon:  Icon(Icons.keyboard_arrow_down,color: ColorManager.gray,),
          isExpanded: true,
          items: items.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
