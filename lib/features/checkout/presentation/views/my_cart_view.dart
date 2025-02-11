import 'package:checkout_app/core/utils/app_images.dart';
import 'package:checkout_app/core/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'My Cart',
          textAlign: TextAlign.center,
          style: AppStyle.styleMedium25,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: SvgPicture.asset(Assets.imagesArrow),
          onPressed: () {},
        ),
      ),
    );
  }
}
