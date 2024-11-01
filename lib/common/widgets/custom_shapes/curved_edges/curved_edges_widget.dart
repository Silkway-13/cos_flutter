import 'package:cos_work_store/common/widgets/custom_shapes/curved_edges/curved_edges.dart';
import 'package:flutter/material.dart';

class CosCurvedEdgeWidget extends StatelessWidget {
  const CosCurvedEdgeWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CosCustomCurvedEdges(),
      child: child,
    );
  }
}
