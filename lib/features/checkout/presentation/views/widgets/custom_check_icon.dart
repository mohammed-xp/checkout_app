import 'package:checkout_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomCheckIcon extends StatelessWidget {
  const CustomCheckIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: -50,
      child: CircleAvatar(
        radius: 50,
        backgroundColor: const Color(0xFFEDEDED),
        // backgroundColor: Colors.red,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: CircleAvatar(
            radius: 50,
            backgroundColor: const Color(0xFF34A853),
            child: SvgPicture.asset(Assets.imagesCheckIcon),
          ),
        ),
      ),
    );
  }
}
