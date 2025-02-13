import 'package:checkout_app/core/widgets/custom_dashed_line.dart';
import 'package:flutter/material.dart';

import 'custom_check_icon.dart';
import 'thank_you_bg.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const ThankYouBg(),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * 0.2,
            left: -20,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * 0.2,
            right: -20,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          Positioned(
              bottom: MediaQuery.sizeOf(context).height * 0.2 + 18,
              left: 28,
              right: 28,
              child: const CustomDashedLine(
                color: Color(0xFFB7B7B7),
              )),
          const CustomCheckIcon(),
        ],
      ),
    );
  }
}
