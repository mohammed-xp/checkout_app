class PaymentIntentInputModel {
  final double amount;
  final String currency;
  final String customerId;

  PaymentIntentInputModel({
    required this.amount,
    required this.currency,
    required this.customerId,
  });

  toJson() {
    int amountOfSubunits = (amount * 100).toInt();
    return {
      'amount': '$amountOfSubunits',
      'currency': currency,
      'customer': customerId,
    };
  }
}
