import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:office_schedule/app/core/localization/languages.dart';
import 'package:office_schedule/app/core/theme/clinical_theme/app_colors.dart';
import 'package:office_schedule/app/core/utils/call_dialog.dart';
import 'package:office_schedule/app/core/utils/form_validator.dart';
import 'package:office_schedule/app/core/widgets/clinical_elevated_button/clinical_elevated_button.dart';
import 'package:office_schedule/app/core/widgets/clinical_form_input/clinical_form_input.dart';

import '../../../core/enums/clinical_form_hint_text_enum.dart';
import '../../../core/enums/clinical_form_title_enum.dart';
import '../../../core/widgets/dialog_error/dialog_error.dart';
import '../login_controller.dart';

class LoginCard extends StatefulWidget {
  const LoginCard({super.key});

  @override
  State<LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  final _loginController = Get.put(LoginController());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool obscureText = true;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
                padding: EdgeInsets.only(top: 34.h, left: 25.w, right: 25.w),
                child: ClinicalFormInput(
                  clinicalFormTitleEnum: ClinicalFormTitleEnum.email,
                  textEditingController: emailController,
                  clinicalFormHintTextEnum: ClinicalFormHintTextEnum.email,
                  validator: emailValidator,
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25.w, right: 25.w),
                child: ClinicalFormInput(
                  clinicalFormTitleEnum: ClinicalFormTitleEnum.password,
                  clinicalFormHintTextEnum: ClinicalFormHintTextEnum.password,
                  textEditingController: passwordController,
                  obscureText: obscureText,
                  validator: passwordValidator,
                  suffixIcon: IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      obscureText
                          ? FluentIcons.eye_off_16_filled
                          : FluentIcons.eye_16_regular,
                      color: AppColors.getTheme().primary,
                      size: 20.sp,
                    ),
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomRight,
                  child: ClinicalElevatedButton(
                    buttonText: Languages.of(context).login.toLowerCase(),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await _loginController.login(
                            email: emailController.text,
                            password: passwordController.text,
                            onSuccess: (response) {
                              Get.offAllNamed('/home', arguments: response);
                            },
                            onError: (error) {
                              callDialog(
                                  context: context,
                                  child: DialogError(
                                    textMessage: Languages.of(context)
                                        .dialogErrorInitialMessage,
                                    textHighlight: error ??
                                        Languages.of(context).loginError,
                                  ));
                            });
                      }
                    },
                    buttonColorEnum: ButtonColorEnum.secondary,
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
