import 'package:flutter/material.dart';

import '../../../../../core/utils/app_style.dart';

class ThankYouBgInfoItem extends StatelessWidget {
  const ThankYouBgInfoItem({
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
          style: AppStyle.styleRegular18,
        ),
        const Spacer(),
        Text(
          value,
          style: AppStyle.styleSemiBold18,
        ),
      ],
    );
  }
}
