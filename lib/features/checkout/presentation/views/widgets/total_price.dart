import 'package:flutter/material.dart';

import '../../../../../core/utils/app_style.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({
    super.key,
    required this.title,
    required this.value,
  });

  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: AppStyle.styleSemiBold24,
        ),
        const Spacer(),
        Text(
          value,
          style: AppStyle.styleSemiBold24,
        ),
      ],
    );
  }
}
