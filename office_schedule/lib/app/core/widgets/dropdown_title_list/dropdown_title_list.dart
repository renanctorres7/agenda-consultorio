import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/clinical_theme/theme.dart';

class DropdownTitleList extends StatefulWidget {
  final String title;
  final Widget child;
  const DropdownTitleList(
      {super.key, required this.title, required this.child});

  @override
  State<DropdownTitleList> createState() => _DropdownTitleListState();
}

class _DropdownTitleListState extends State<DropdownTitleList>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  bool _isExpanded = true;

  Animation<double>? _animation;

  double _opacity = 1.0;

  _animateIcon() {
    if (!_isExpanded) {
      _controller!.reverse(from: 0.5);
      setState(() {
        _opacity = 1.0;
      });
    } else {
      _controller!.forward(from: 0);
      setState(() {
        _opacity = 0.0;
      });
    }
    _isExpanded = !_isExpanded;
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      upperBound: 0.5,
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller!);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 16.h),
          padding: EdgeInsets.only(left: 20.w),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.title,
                    textAlign: TextAlign.left,
                    style: ClinicalTextTypes.datetimeTitle,
                  ),
                ),
              ),
              IconButton(
                onPressed: () => _animateIcon(),
                icon: RotationTransition(
                    turns: _animation!,
                    child: const Icon(Icons.expand_more_rounded)),
              )
            ],
          ),
        ),
        AnimatedOpacity(
          opacity: _opacity,
          duration: const Duration(milliseconds: 400),
          child: _opacity != 0 ? widget.child : const SizedBox(),
        )
      ],
    );
  }
}
