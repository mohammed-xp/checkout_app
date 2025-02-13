import 'package:flutter/material.dart';

class CustomDashedLine extends StatelessWidget {
  const CustomDashedLine({
    super.key,
    required this.color,
    this.thickness = 2,
    this.dashQuantity = 20,
    this.dashGap = 3,
  });

  final Color color;
  final double thickness;
  final int dashQuantity;
  final double dashGap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        dashQuantity,
        (index) => Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: dashGap),
            child: Container(
              height: thickness,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
