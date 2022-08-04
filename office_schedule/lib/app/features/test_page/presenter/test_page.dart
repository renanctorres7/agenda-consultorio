import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_schedule/app/core/extensions/context.dart';
import 'package:office_schedule/app/core/widgets/clinical_elevated_button/clinical_elevated_button.dart';
import 'package:office_schedule/app/core/widgets/clinical_form_input/exports.dart';

import '../../../core/widgets/clinical_card/clinical_card.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: context.screenSize.height,
        width: context.screenSize.width,
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              height: 200.h,
            ),
          ],
        ),
      ),
    );
  }
}
