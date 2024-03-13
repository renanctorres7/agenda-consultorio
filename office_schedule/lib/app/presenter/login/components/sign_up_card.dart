import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_schedule/app/core/localization/languages.dart';
import 'package:office_schedule/app/core/theme/clinical_theme/app_colors.dart';
import 'package:office_schedule/app/core/widgets/clinical_elevated_button/clinical_elevated_button.dart';
import 'package:office_schedule/app/core/widgets/clinical_form_input/clinical_form_input.dart';

import '../../../core/enums/clinical_form_hint_text_enum.dart';
import '../../../core/enums/clinical_form_title_enum.dart';

class SignUpCard extends StatefulWidget {
  const SignUpCard({super.key});

  @override
  State<SignUpCard> createState() => _SignUpCardState();
}

class _SignUpCardState extends State<SignUpCard> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController specialtyController = TextEditingController();
  TextEditingController companyController = TextEditingController();

  bool obscureText = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
    fullNameController.dispose();
    phoneController.dispose();
    specialtyController.dispose();
    companyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 615.h,
      margin: EdgeInsets.only(left: 20.w, right: 20.w),
      decoration: AppColors.getTheme().cardDecoration,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 30.h, left: 25.w, right: 25.w),
            child: ClinicalFormInput(
              clinicalFormTitleEnum: ClinicalFormTitleEnum.fullName,
              textEditingController: fullNameController,
              clinicalFormHintTextEnum: ClinicalFormHintTextEnum.fullName,
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 25.w, right: 25.w),
              child: ClinicalFormInput(
                clinicalFormTitleEnum: ClinicalFormTitleEnum.email,
                clinicalFormHintTextEnum: ClinicalFormHintTextEnum.email,
                textEditingController: emailController,
              )),
          Padding(
            padding: EdgeInsets.only(left: 25.w, right: 25.w),
            child: ClinicalFormInput(
              clinicalFormTitleEnum: ClinicalFormTitleEnum.password,
              clinicalFormHintTextEnum: ClinicalFormHintTextEnum.password,
              textEditingController: passwordController,
              obscureText: obscureText,
              suffixIcon: IconButton(
                icon: Icon(
                  obscureText
                      ? FluentIcons.eye_off_16_filled
                      : FluentIcons.eye_16_regular,
                  color: AppColors.getTheme().primary,
                ),
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.w, right: 25.w),
            child: ClinicalFormInput(
              clinicalFormTitleEnum: ClinicalFormTitleEnum.passwordConfirm,
              clinicalFormHintTextEnum:
                  ClinicalFormHintTextEnum.passwordConfirm,
              textEditingController: passwordConfirmController,
              obscureText: obscureText,
              suffixIcon: IconButton(
                icon: Icon(
                  obscureText
                      ? FluentIcons.eye_off_16_filled
                      : FluentIcons.eye_16_regular,
                  color: AppColors.getTheme().primary,
                ),
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 25.w, right: 25.w),
              child: ClinicalFormInput(
                clinicalFormTitleEnum: ClinicalFormTitleEnum.phone,
                clinicalFormHintTextEnum: ClinicalFormHintTextEnum.phone,
                textEditingController: phoneController,
              )),
          Padding(
            padding: EdgeInsets.only(left: 25.w, right: 25.w),
            child: Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: ClinicalFormInput(
                      clinicalFormTitleEnum: ClinicalFormTitleEnum.specialty,
                      textEditingController: specialtyController,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Flexible(
                    child: ClinicalFormInput(
                      clinicalFormTitleEnum: ClinicalFormTitleEnum.company,
                      textEditingController: companyController,
                    ),
                  )
                ]),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              child: ClinicalElevatedButton(
                buttonText: Languages.of(context).signUpButton,
                onPressed: () {},
                buttonColorEnum: ButtonColorEnum.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
