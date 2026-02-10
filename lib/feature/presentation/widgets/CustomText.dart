import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends ConsumerWidget {
  final String text;
  final String? subtitle;
  final bool? softWrap;
  final Color? color;
  final double? size;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final TextDecoration? decoration;
  final Color? decorationColor; // <-- underline color
  final double? decorationThickness;
  final int? maxLines;
  final TextOverflow? overflow; // <-- underline thickness/height

  const CustomText({
    super.key,
    required this.text,
    this.color,
    this.size,
    this.textAlign,
    this.fontWeight,
    this.decoration,
    this.decorationColor,
    this.decorationThickness,
    this.subtitle,
    this.softWrap,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      subtitle ?? text,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      style: GoogleFonts.dmSans(
        color: color,
        fontWeight: fontWeight,
        fontSize: size,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationThickness: decorationThickness,
      ),
    );
  }
}