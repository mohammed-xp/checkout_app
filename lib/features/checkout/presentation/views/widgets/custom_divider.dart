import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, this.paddingHorizontal = 15});

  final double paddingHorizontal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
      child: const Divider(
        color: Color(0xffC7C7C7),
        thickness: 2,
      ),
    );
  }
}
