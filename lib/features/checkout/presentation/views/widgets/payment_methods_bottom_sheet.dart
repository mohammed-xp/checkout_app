import 'package:checkout_app/features/checkout/presentation/views/widgets/custom_button_bloc_consumer.dart';
import 'package:checkout_app/features/checkout/presentation/views/widgets/payment_methods.dart';
import 'package:flutter/material.dart';

class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 16,
          ),
          PaymentMethods(),
          SizedBox(height: 32),
          CustomButtonBlocConsumer(),
        ],
      ),
    );
  }
}
