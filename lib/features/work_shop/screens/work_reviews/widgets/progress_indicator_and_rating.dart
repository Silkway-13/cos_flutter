import 'package:cos_work_store/utils/constants/colors.dart';
import 'package:cos_work_store/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class CosRatingProgressIndicator extends StatelessWidget {
  const CosRatingProgressIndicator({
    super.key,
    required this.text,
    required this.value,
  });

  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Expanded(
          flex: 11,
          child: SizedBox(
            width: CosDeviceUtils.getScreenWidth() * 0.8,
            child: LinearProgressIndicator(
              value: value,
              minHeight: 11,
              backgroundColor: CosColors.grey,
              borderRadius: BorderRadius.circular(7),
              valueColor: const AlwaysStoppedAnimation(CosColors.primary),
            ),
          ),
        ),
      ],
    );
  }
}
