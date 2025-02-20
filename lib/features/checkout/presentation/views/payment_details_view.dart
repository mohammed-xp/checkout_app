import 'package:checkout_app/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import 'widgets/payment_details_view_body.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context,
        title: 'Payment Details',
        onPressedIconBackButton: () => Navigator.pop(context),
      ),
      body: const PaymentDetailsViewBody(),
    );
  }
}
