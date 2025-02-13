import 'package:flutter/material.dart';

import 'thank_you_bg_info_item.dart';

class ThankYouBgInfo extends StatelessWidget {
  const ThankYouBgInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ThankYouBgInfoItem(
          title: 'Date',
          value: '01/24/2023',
        ),
        SizedBox(
          height: 20,
        ),
        ThankYouBgInfoItem(
          title: 'Time',
          value: '10:15 AM',
        ),
        SizedBox(
          height: 20,
        ),
        ThankYouBgInfoItem(
          title: 'To',
          value: 'Sam Louis',
        ),
      ],
    );
  }
}
