import 'package:flutter/material.dart';

class CosSectionHeading extends StatelessWidget {
  const CosSectionHeading({
    super.key,
    required this.title,
    this.buttonTitle = 'Бүгдийн үзэх',
    this.showActionButton = true,
    this.textColor,
    this.onPressed,
    this.maxLines = 1,
  });

  final String title, buttonTitle;
  final bool showActionButton;
  final Color? textColor;
  final void Function()? onPressed;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: textColor),
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
        ),
        if (showActionButton)
          TextButton(onPressed: onPressed, child: Text(buttonTitle))
      ],
    );
  }
}
