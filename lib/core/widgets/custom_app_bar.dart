import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_images.dart';
import '../utils/app_style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
    context, {
    super.key,
    required this.title,
    this.onPressedIconBackButton,
  });

  final String title;

  final void Function()? onPressedIconBackButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white.withOpacity(0.0),
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: AppStyle.styleMedium25,
      ),
      centerTitle: true,
      leading: IconButton(
        icon: SvgPicture.asset(Assets.imagesArrow),
        onPressed: onPressedIconBackButton,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(53.0);
}
