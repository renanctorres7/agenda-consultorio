import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:office_schedule/app/core/localization/languages.dart';
import 'package:office_schedule/app/core/theme/clinical_theme/app_colors.dart';
import 'package:office_schedule/app/core/widgets/dialog_error/dialog_error.dart';
import 'package:office_schedule/app/presenter/login/components/login_card.dart';
import 'package:office_schedule/app/presenter/login/components/sign_up_card.dart';
import 'package:office_schedule/app/presenter/login/components/status_bar_widget.dart';
import 'package:office_schedule/app/presenter/login/login_controller.dart';

import '../../core/icons/clinical_images.dart';
import '../../core/theme/clinical_theme/theme.dart';
import 'components/login_tab_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  final _loginController = Get.put(LoginController());

  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _loginController.tabController = TabController(
        length: 2,
        vsync: this,
        animationDuration: const Duration(milliseconds: 500));

    _animation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: _loginController.tabController!.animation!,
        curve: Curves.easeIn));
  }

  @override
  void dispose() {
    _loginController.tabController?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => StatusBarWidget(
          color: _loginController.tabIndex.value == 0
              ? AppColors.getTheme().primary
              : AppColors.getTheme().secondaryDark,
          child: SingleChildScrollView(
            child: AnimatedBuilder(
                animation: _loginController.tabController!.animation!,
                builder: (context, widget) {
                  return Column(
                    children: [
                      Opacity(
                        opacity: _animation.value,
                        child: SizeTransition(
                          sizeFactor: _animation,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 27.w,
                                right: 27.w,
                                top: 25.h,
                                bottom: 15.h),
                            child: Image.asset(
                              ClinicalImages.psychologistIllustration,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 46.0.h),
                        child: Text(
                          'Agenda Clínica',
                          style: ClinicalTextTypes.appTitleText,
                        ),
                      ),
                      const LoginTabBar(),
                      AnimatedCrossFade(
                        duration: const Duration(milliseconds: 500),
                        crossFadeState: _loginController.tabIndex.value == 0
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                        firstChild: const LoginCard(),
                        secondChild: const SignUpCard(),
                      ),
                      _loginController.tabIndex.value == 0
                          ? Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(top: 55.h),
                              child: Text(
                                Languages.of(context).forgotPassword,
                                style: ClinicalTextTypes.forgotPasswordText,
                              ),
                            )
                          : const SizedBox(),
                      const DialogError(
                        textMessage: '',
                        textHighlight: '',
                      )
                    ],
                  );
                }),
          ),
        ));
  }
}
