import 'package:checkout_app/core/utils/app_images.dart';
import 'package:checkout_app/features/checkout/presentation/views/widgets/custom_button.dart';
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
            onPressed: () {},
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
