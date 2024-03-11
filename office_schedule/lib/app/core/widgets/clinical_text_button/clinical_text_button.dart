import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ClinicalTextButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function()? onPressed;
  const ClinicalTextButton(
      {super.key, required this.text, required this.color, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18.h,
      alignment: Alignment.bottomRight,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: GoogleFonts.poppins(
              fontSize: 14.sp, fontWeight: FontWeight.w700, color: color),
        ),
      ),
    );
  }
}
