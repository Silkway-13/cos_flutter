import 'package:cos_work_store/common/widgets/custom_shapes/container/circular_container.dart';
import 'package:cos_work_store/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:cos_work_store/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CosPrimaryHeaderContainer extends StatelessWidget {
  const CosPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CosCurvedEdgeWidget(
      child: Container(
        color: CosColors.primary,
        // padding: const EdgeInsets.only(bottom: 0),

        /// -- If [size.isFinite': is not true.in Stack] error occurred

        child: Stack(
          children: [
            /// -- Background Custom Shapes
            Positioned(
              top: -150,
              right: -250,
              child: CosCircularContainer(
                backgroundColor: CosColors.textWhite.withOpacity(0.1),
              ),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: CosCircularContainer(
                backgroundColor: CosColors.textWhite.withOpacity(0.1),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
