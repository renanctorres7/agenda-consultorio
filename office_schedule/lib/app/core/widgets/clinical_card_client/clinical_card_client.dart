import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/theme.dart';

class ClinicalCardClient extends StatelessWidget {
  const ClinicalCardClient(
      {Key? key,
      required this.clientFullName,
      required this.clientPhone,
      this.onTap})
      : super(key: key);

  final String clientFullName;
  final String clientPhone;

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Container(
          width: 350.w,
          height: 62.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              color: ClinicalColorsLightTheme.colorWhite,
              boxShadow: [
                BoxShadow(
                    blurRadius: 14.r,
                    offset: const Offset(0, 4),
                    color: Colors.black.withOpacity(0.15))
              ]),
          margin: EdgeInsets.only(bottom: 20.h),
          padding:
              EdgeInsets.only(top: 13.h, bottom: 13.h, left: 16.w, right: 70.w),
          child: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  child: _customListTile(
                label: 'Paciente',
                text: clientFullName,
              )),
              Flexible(
                  child: _customListTile(
                label: 'Telefone',
                text: clientPhone,
              )),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _customListTile({required String label, required String text}) {
  return Flex(
    direction: Axis.vertical,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Flexible(
        child: Text(
          label,
          style: GoogleFonts.poppins(
              fontSize: 10.sp,
              fontWeight: FontWeight.w300,
              color: ClinicalColorsLightTheme.secondaryDark),
        ),
      ),
      Flexible(
        child: AutoSizeText(
          text,
          minFontSize: 10,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.poppins(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: ClinicalColorsLightTheme.secondaryDark),
        ),
      )
    ],
  );
}
