import 'package:flutter/material.dart';

import '../../../../../core/utils/app_images.dart';
import 'payment_method_item.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({super.key});

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  final List<String> paymentMethodsItems = const [
    Assets.imagesCard,
    Assets.imagesPaypalLogo,
    Assets.imagesApplePayLogo,
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.07,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: paymentMethodsItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              child: PaymentMethodItem(
                isActive: _selectedIndex == index,
                imageSvgAsset: paymentMethodsItems[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
