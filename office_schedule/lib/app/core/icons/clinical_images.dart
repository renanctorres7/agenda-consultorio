import 'package:flutter/material.dart';

const String _path = 'assets/images';

class ClinicalImages {
  static const String psychologistIllustration =
      '$_path/psychologistIllustration.png';

  static loadImages(BuildContext context) async {
    Future.wait([
      precacheImage(const AssetImage(psychologistIllustration), context),
    ]);
  }
}
