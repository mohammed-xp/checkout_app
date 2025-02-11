import 'package:checkout_app/features/checkout/presentation/views/widgets/my_cart_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context,
        title: 'My Cart',
        onPressedIconBackButton: () {},
      ),
      body: const MyCartViewBody(),
    );
  }
}
