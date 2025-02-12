import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({
    super.key,
    required this.isActive,
    required this.imageSvgAsset,
  });

  final bool isActive;
  final String imageSvgAsset;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 103 / 62,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        // width: 103,
        // height: 62,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1.50,
              color: isActive ? const Color(0xFF34A853) : Colors.grey,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          shadows: isActive
              ? const [
                  BoxShadow(
                    color: Color(0xFF34A853),
                    blurRadius: 4,
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                  )
                ]
              : null,
        ),
        child: Center(
          child: SvgPicture.asset(imageSvgAsset),
        ),
      ),
    );
  }
}
