import 'package:checkout_app/core/utils/app_images.dart';
import 'package:checkout_app/core/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_svg/svg.dart';

class CustomCreditCard extends StatefulWidget {
  const CustomCreditCard(
      {super.key, required this.formKey, required this.autovalidateMode});

  final GlobalKey<FormState> formKey;

  final AutovalidateMode autovalidateMode;

  @override
  State<CustomCreditCard> createState() => _CustomCreditCardState();
}

class _CustomCreditCardState extends State<CustomCreditCard> {
  String cardNumber = '', expiryDate = '', cardHolderName = '', cvvCode = '';

  bool showBackView = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          showBackView: showBackView,
          isHolderNameVisible: true,
          onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
          backgroundImage: Assets.imagesBackgoundCard,
          bankName: 'Credit',
          // glassmorphismConfig: Glassmorphism.defaultConfig(),
          isChipVisible: false,
          textStyle: AppStyle.styleSemiBold14,
          cardType: CardType.mastercard,
          customCardTypeIcons: [
            CustomCardTypeIcon(
              cardImage: SvgPicture.asset(Assets.imagesMastercardLogo),
              cardType: CardType.mastercard,
            )
          ],
          // enableFloatingCard: true,
          cardBgColor: Colors.white.withOpacity(0.0),
          isSwipeGestureEnabled: false,
        ),
        const SizedBox(
          height: 12,
        ),
        CreditCardForm(
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          autovalidateMode: widget.autovalidateMode,
          onCreditCardModelChange: (CreditCardModel creditCardModel) {
            cardNumber = creditCardModel.cardNumber;
            expiryDate = creditCardModel.expiryDate;
            cardHolderName = creditCardModel.cardHolderName;
            cvvCode = creditCardModel.cvvCode;
            showBackView = creditCardModel.isCvvFocused;
            setState(() {});
          },
          formKey: widget.formKey,
        ),
      ],
    );
  }
}
