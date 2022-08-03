import 'package:compass_foundation/foundation/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:office_schedule/app/core/theme/clinical_texts_types.dart';

import 'exports.dart';

class ClinicalFormInput extends StatefulWidget {
  const ClinicalFormInput(
      {Key? key,
      required this.clinicalFormIconEnum,
      required this.clinicalFormTitleEnum,
      this.initialValue,
      this.clinicalFormHintTextEnum,
      this.textEditingController,
      this.keyboardType,
      this.autofocus,
      this.readOnly,
      this.obscureText,
      this.maxLength,
      this.onChanged,
      this.onTap,
      this.onEditingComplete,
      this.onFieldSubmitted,
      this.onSaved,
      this.validator,
      this.inputFormatters,
      this.enabled,
      this.autovalidateMode})
      : super(key: key);

  final ClinicalFormIconEnum clinicalFormIconEnum;
  final ClinicalFormTitleEnum clinicalFormTitleEnum;
  final String? initialValue;
  final ClinicalFormHintTextEnum? clinicalFormHintTextEnum;
  final TextEditingController? textEditingController;
  final TextInputType? keyboardType;
  final bool? autofocus;
  final bool? readOnly;
  final bool? obscureText;

  final int? maxLength;
  final Function(String)? onChanged;
  final Function()? onTap;
  final Function()? onEditingComplete;
  final Function(String)? onFieldSubmitted;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final AutovalidateMode? autovalidateMode;

  @override
  State<ClinicalFormInput> createState() => _ClinicalFormInputState();
}

class _ClinicalFormInputState extends State<ClinicalFormInput> {
  final int? maxLines = 1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenSize.width,
      height: 66.h,
      child: Flex(
        direction: Axis.vertical,
        children: [
          Flexible(
            child: Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: SvgPicture.asset(widget.clinicalFormIconEnum.icon,
                      width: 16.w, fit: BoxFit.fitWidth),
                ),
                Text(
                  widget.clinicalFormTitleEnum.title,
                  style: ClinicalTextTypes.formTitleText,
                )
              ],
            ),
          ),
          Flexible(
              child: TextFormField(
            controller: widget.textEditingController,
            keyboardType: widget.keyboardType,
            autofocus: widget.autofocus ?? false,
            readOnly: widget.readOnly ?? false,
            obscureText: widget.obscureText ?? false,
            maxLines: maxLines,
            maxLength: widget.maxLength,
            onChanged: widget.onChanged,
            onTap: widget.onTap,
            onEditingComplete: widget.onEditingComplete,
            onFieldSubmitted: widget.onFieldSubmitted,
            onSaved: widget.onSaved,
            validator: widget.validator,
            inputFormatters: widget.inputFormatters,
            enabled: widget.enabled,
            autovalidateMode: widget.autovalidateMode,
            scrollPadding: EdgeInsets.zero,
            style: ClinicalTextTypes.bodyText,
            initialValue: widget.initialValue,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 25.w),
                hintText: widget.initialValue != null
                    ? ''
                    : widget.clinicalFormHintTextEnum?.hintText ?? '',
                hintStyle: ClinicalTextTypes.bodyText),
          )),
        ],
      ),
    );
  }
}
