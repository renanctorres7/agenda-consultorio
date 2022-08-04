import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:office_schedule/app/core/extensions/context.dart';

import '../../icons/clinical_icons.dart';
import '../../theme/theme.dart';

enum PaymentStatusColorEnum {
  pago(ClinicalColorsLightTheme.primaryLighter),
  pendente(ClinicalColorsLightTheme.dangerRed);

  final Color color;
  const PaymentStatusColorEnum(this.color);
}

class ClinicalFormPaymentType extends StatefulWidget {
  const ClinicalFormPaymentType({
    Key? key,
    this.paymentTypeText,
    this.paymentStatusText,
  }) : super(key: key);

  final String? paymentTypeText;
  final String? paymentStatusText;

  @override
  State<ClinicalFormPaymentType> createState() =>
      _ClinicalFormPaymentTypeState();
}

class _ClinicalFormPaymentTypeState extends State<ClinicalFormPaymentType> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h, left: 20.w, right: 20.w),
      child: Container(
        width: context.screenSize.width,
        height: 68.h,
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 1.0,
                    color: ClinicalColorsLightTheme.colorGrayLight))),
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
                child: _typePayment(
              initialValue: widget.paymentTypeText,
            )),
            Flexible(
                child: _statusPayment(
                    initialValue: widget.paymentStatusText,
                    paymentStatusColorEnum: _getColorOfPaymentStatus(
                        widget.paymentStatusText ?? 'pendente'))),
          ],
        ),
      ),
    );
  }
}

Widget _typePayment({String? initialValue}) {
  return Flex(
    direction: Axis.vertical,
    children: [
      SizedBox(
        height: 18.h,
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: SvgPicture.asset(ClinicalIcons.formPaymentGray,
                  width: 16.w, fit: BoxFit.fitWidth),
            ),
            Expanded(
              child: Text(
                'Tipo de pagamento',
                style: ClinicalTextTypes.formTitleText,
              ),
            ),
          ],
        ),
      ),
      Container(
          height: 44.h,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(left: 20.w),
          child: Text(initialValue ?? 'Não especificado',
              style: ClinicalTextTypes.bodyText)),
    ],
  );
}

Widget _statusPayment(
    {String? initialValue,
    required PaymentStatusColorEnum paymentStatusColorEnum}) {
  return Flex(
    direction: Axis.vertical,
    children: [
      SizedBox(
        height: 18.h,
        child: Text(
          'Status pagamento',
          style: ClinicalTextTypes.formTitleText,
        ),
      ),
      Container(
          height: 44.h,
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 24.h,
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
              color: paymentStatusColorEnum.color,
            ),
            child: Text(
              initialValue ?? '',
              style: paymentStatusColorEnum.name == "pago"
                  ? ClinicalTextTypes.bodyText
                  : ClinicalTextTypes.bodyTextWhite,
            ),
          )),
    ],
  );
}

PaymentStatusColorEnum _getColorOfPaymentStatus(String paymentStatusText) {
  switch (paymentStatusText) {
    case "pago":
      return PaymentStatusColorEnum.pago;
    case "pendente":
    default:
      return PaymentStatusColorEnum.pendente;
  }
}
