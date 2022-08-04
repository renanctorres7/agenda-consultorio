import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_schedule/app/core/extensions/context.dart';
import 'package:office_schedule/app/core/widgets/clinical_card/clinical_card.dart';
import 'package:office_schedule/app/core/widgets/clinical_form_payment_type/clinical_form_payment_type.dart';
import 'package:office_schedule/app/core/widgets/clinical_text_button/clinical_text_button.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

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
