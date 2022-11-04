import 'dart:ui';

import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  final Widget child;
  final double blur;
  final double opacity;

  const GlassContainer({
    super.key,
    required this.child,
    this.blur = 10,
    this.opacity = 0.3,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: blur,
          sigmaY: blur,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(opacity),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.white,
              width: 1.5,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
