import 'package:checkout_app/core/utils/app_images.dart';
import 'package:checkout_app/features/checkout/presentation/views/widgets/custom_divider.dart';
import 'package:checkout_app/features/checkout/presentation/views/widgets/total_price.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_style.dart';
import 'card_info_widget.dart';
import 'thank_you_bg_info.dart';

class ThankYouBg extends StatelessWidget {
  const ThankYouBg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: ShapeDecoration(
        color: const Color(0xFFEDEDED),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 50 + 16),
          const Text(
            'Thank You!',
            style: AppStyle.styleMedium25,
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            'Your transaction was successful',
            style: AppStyle.styleRegular20,
          ),
          const SizedBox(
            height: 40,
          ),
          const ThankYouBgInfo(),
          const SizedBox(
            height: 30,
          ),
          const CustomDivider(
            paddingHorizontal: 0,
          ),
          const SizedBox(
            height: 24,
          ),
          const TotalPrice(
            title: 'Total',
            value: '\$50.97',
          ),
          const SizedBox(
            height: 30,
          ),
          const CardInfoWidget(),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(Assets.imagesBarCode),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 29,
                    vertical: 14,
                  ),
                  foregroundColor: const Color(0xff34A853),
                  shape: RoundedRectangleBorder(
                    // side: BorderSide(width: 1.50, color: Color(0xFF34A853)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  side: const BorderSide(
                    color: Color(0xff34A853),
                    width: 1.5,
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'PAID',
                  style: AppStyle.styleSemiBold24
                      .copyWith(color: const Color(0xff34A853)),
                ),
              )
            ],
          ),
          SizedBox(
            height: ((MediaQuery.sizeOf(context).height * 0.2 + 18) / 2) - 29,
          ),
        ],
      ),
    );
  }
}
