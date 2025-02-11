import 'package:flutter/material.dart';

import '../../../../../core/utils/app_style.dart';

class OrderInfoItem extends StatelessWidget {
  const OrderInfoItem({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: AppStyle.styleRegular18,
        ),
        const Spacer(),
        Text(
          value,
          style: AppStyle.styleRegular18,
        ),
      ],
    );
  }
}
