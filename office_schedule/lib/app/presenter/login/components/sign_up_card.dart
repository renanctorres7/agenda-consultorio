import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:office_schedule/app/core/localization/languages.dart';
import 'package:office_schedule/app/core/theme/clinical_theme/app_colors.dart';
import 'package:office_schedule/app/core/widgets/clinical_elevated_button/clinical_elevated_button.dart';
import 'package:office_schedule/app/core/widgets/clinical_form_input/clinical_form_input.dart';

import '../../../core/enums/clinical_form_hint_text_enum.dart';
import '../../../core/enums/clinical_form_title_enum.dart';
import '../../../core/utils/form_validator.dart';

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

  final _formKey = GlobalKey<FormState>();

  MaskTextInputFormatter maskFormatter = MaskTextInputFormatter(
      mask: "(##) #####-####",
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

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
    return IntrinsicHeight(
      child: Container(
        margin: EdgeInsets.only(left: 20.w, right: 20.w),
        decoration: AppColors.getTheme().cardDecoration,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30.h, left: 25.w, right: 25.w),
                child: ClinicalFormInput(
                  clinicalFormTitleEnum: ClinicalFormTitleEnum.fullName,
                  textEditingController: fullNameController,
                  clinicalFormHintTextEnum: ClinicalFormHintTextEnum.fullName,
                  validator: fullNameValidator,
                  keyboardType: TextInputType.name,
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 25.w, right: 25.w),
                  child: ClinicalFormInput(
                    clinicalFormTitleEnum: ClinicalFormTitleEnum.email,
                    clinicalFormHintTextEnum: ClinicalFormHintTextEnum.email,
                    textEditingController: emailController,
                    validator: emailValidator,
                    keyboardType: TextInputType.emailAddress,
                  )),
              Padding(
                padding: EdgeInsets.only(left: 25.w, right: 25.w),
                child: ClinicalFormInput(
                  clinicalFormTitleEnum: ClinicalFormTitleEnum.password,
                  clinicalFormHintTextEnum: ClinicalFormHintTextEnum.password,
                  textEditingController: passwordController,
                  validator: passwordValidator,
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
                  validator: (value) =>
                      passwordConfirmValidator(value, passwordController.text),
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
                    keyboardType: TextInputType.phone,
                    validator: phoneValidator,
                    inputFormatters: [maskFormatter],
                  )),
              Padding(
                padding: EdgeInsets.only(left: 25.w, right: 25.w),
                child: Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: ClinicalFormInput(
                          clinicalFormTitleEnum:
                              ClinicalFormTitleEnum.specialty,
                          textEditingController: specialtyController,
                          validator: genericValidator,
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Flexible(
                        child: ClinicalFormInput(
                          clinicalFormTitleEnum: ClinicalFormTitleEnum.company,
                          textEditingController: companyController,
                          validator: genericValidator,
                          keyboardType: TextInputType.name,
                        ),
                      )
                    ]),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomRight,
                  child: ClinicalElevatedButton(
                    buttonText: Languages.of(context).signUpButton,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                    buttonColorEnum: ButtonColorEnum.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
