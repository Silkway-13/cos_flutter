import 'package:cos_work_store/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CosShadowStyle {
  static final verticalWorkShadow = BoxShadow(
      color: CosColors.darkGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));

  static final horizontalWorkShadow = BoxShadow(
      color: CosColors.darkGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));
}
