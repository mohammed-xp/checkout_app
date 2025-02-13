import 'package:checkout_app/core/utils/app_images.dart';
import 'package:checkout_app/features/checkout/presentation/views/payment_details_view.dart';
import 'package:checkout_app/features/checkout/presentation/views/widgets/custom_button.dart';
import 'package:checkout_app/features/checkout/presentation/views/widgets/payment_methods.dart';
import 'package:flutter/material.dart';

import 'custom_divider.dart';
import 'order_info_item.dart';
import 'total_price.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // const SizedBox(height: 16),
          Expanded(child: Image.asset(Assets.imagesBasket)),
          const SizedBox(height: 24),
          const OrderInfoItem(
            title: 'Order Subtotal',
            value: '\$42.97',
          ),
          const SizedBox(height: 3),
          const OrderInfoItem(
            title: 'Discount',
            value: '\$0',
          ),
          const SizedBox(height: 3),

          const OrderInfoItem(
            title: 'Shipping',
            value: '\$8',
          ),
          const SizedBox(height: 10),
          const CustomDivider(),
          const SizedBox(height: 10),
          const TotalPrice(title: 'Total', value: '\$50.97'),
          const SizedBox(height: 16),
          CustomButton(
            title: 'Complete Payment',
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   return const PaymentDetailsView();
              // }));

              showModalBottomSheet(
                context: context,
                builder: (context) => const PaymentMethodsBottomSheet(),
              );
            },
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}

class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 16,
          ),
          const PaymentMethods(),
          const SizedBox(height: 32),
          CustomButton(
            title: 'Continue',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PaymentDetailsView(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
