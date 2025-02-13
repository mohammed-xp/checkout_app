import 'package:checkout_app/features/checkout/presentation/views/widgets/thank_you_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context,
        title: '',
        onPressedIconBackButton: () {
          Navigator.pop(context);
        },
      ),
      body: Transform.translate(
        offset: const Offset(0, -25),
        child: const ThankYouViewBody(),
      ),
    );
  }
}
