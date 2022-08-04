

import 'package:flutter/material.dart';
import 'package:office_schedule/app/core/extensions/context.dart';
import 'package:office_schedule/app/core/theme/theme.dart';

class ClinicalAvatarImageNetwork extends StatelessWidget {
  const ClinicalAvatarImageNetwork({Key? key, required this.image}) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenSize.width,
      height: context.screenSize.height,
      child: Image.network(
        image,
        fit: BoxFit.cover,
        errorBuilder: (context, exception, stackTrace) {
          return Center(
            child: Image.asset(
              'assets/images/avatar_icon_image.png',
              fit: BoxFit.cover,
            ),
          );
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }

          return SizedBox(
            width: context.screenSize.width,
            height: context.screenSize.height,
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 200,
                child: LinearProgressIndicator(
                  color: ClinicalColorsLightTheme.primary,
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
