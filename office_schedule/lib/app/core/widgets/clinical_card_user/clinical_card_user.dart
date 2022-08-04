import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/theme.dart';
import '../clinical_avatar_image_network/clinical_avatar_image_network.dart';

class ClinicalCardUser extends StatelessWidget {
  const ClinicalCardUser(
      {Key? key,
      required this.userFullName,
      required this.userCompany,
      required this.userSpecialty,
      required this.userProfileImageUrl,
      this.onTap})
      : super(key: key);

  final String userFullName;
  final String userCompany;
  final String userSpecialty;
  final String userProfileImageUrl;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Container(
          width: 350.w,
          height: 90.h,
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
              EdgeInsets.only(top: 13.h, bottom: 13.h, left: 16.w, right: 16.w),
          child: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 2,
                child: Flex(
                  direction: Axis.vertical,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Flexible(
                        child: _customListTile(
                      label: 'Usuário',
                      text: userFullName,
                    )),
                    Flexible(
                        child: _customListTile(
                      label: 'Empresa',
                      text: userCompany,
                    )),
                  ],
                ),
              ),
              Flexible(
                flex: 2,
                child: Flex(
                  direction: Axis.vertical,
                  children: [
                    const Spacer(),
                    Flexible(
                        child: _customListTile(
                      label: 'Especialidade',
                      text: userSpecialty,
                    )),
                  ],
                ),
              ),
              Expanded(
                  child: SizedBox(
                width: 60.w,
                height: 60.h,
                child: CircleAvatar(
                  radius: 60.w,
                  child: ClinicalAvatarImageNetwork(
                    image: userProfileImageUrl,
                  ),
                ),
              ))
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
              color: ClinicalColorsLightTheme.primaryDark),
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
              color: ClinicalColorsLightTheme.primaryDark),
        ),
      )
    ],
  );
}
