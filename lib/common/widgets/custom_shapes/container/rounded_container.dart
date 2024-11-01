import 'package:cos_work_store/utils/constants/colors.dart';
import 'package:cos_work_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CosRoundedContainer extends StatelessWidget {
  const CosRoundedContainer({
    super.key,
    this.child,
    this.width,
    this.heigth,
    this.margin,
    this.padding,
    this.showBorder = false,
    this.radius = CosSizes.cardRadiusLg,
    this.backgroundColor = CosColors.white,
    this.borderColor = CosColors.borderPrimary,
  });

  final double? width;
  final double? heigth;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: heigth,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
