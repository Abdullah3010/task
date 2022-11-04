import 'package:flutter/material.dart';
import 'package:jop_task/core/utils/app_colors.dart';

class RoundedButton extends StatelessWidget {
  final Widget child;
  final Function onPressed;
  final double? borderRadius;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final Color color;

  const RoundedButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.borderRadius = 15,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 15,
      vertical: 10,
    ),
    this.margin = const EdgeInsets.symmetric(
      horizontal: 22,
      vertical: 10,
    ),
    this.color = AppColors.primary,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius!),
          color: color,
        ),
        child: child,
      ),
    );
  }
}
