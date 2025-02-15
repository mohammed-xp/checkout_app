class StripeInitPaymentSheetInputModel {
  final String paymentIntentClientSecret;
  final String customerId;
  final String customerEphemeralKeySecret;

  StripeInitPaymentSheetInputModel({
    required this.paymentIntentClientSecret,
    required this.customerId,
    required this.customerEphemeralKeySecret,
  });
}
