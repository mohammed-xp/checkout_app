import 'package:checkout_app/core/api_keys.dart';
import 'package:checkout_app/core/services/api_service.dart';
import 'package:checkout_app/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_app/features/checkout/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripePaymentService {
  final ApiService _apiService;

  StripePaymentService(this._apiService);

  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    const String url = 'https://api.stripe.com/v1/payment_intents';

    var response = await _apiService.post(
      url: url,
      body: paymentIntentInputModel.toJson(),
      token: ApiKeys.stripeSecretKey,
    );

    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);

    return paymentIntentModel;
  }

  Future<void> initPaymentSheet({
    required String paymentIntentClientSecret,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        // Main params
        merchantDisplayName: 'Mohammed Adil',
        paymentIntentClientSecret: paymentIntentClientSecret,
      ),
    );
  }

  Future<void> presentPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future<void> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    PaymentIntentModel paymentIntentModel =
        await createPaymentIntent(paymentIntentInputModel);
    await initPaymentSheet(
        paymentIntentClientSecret: paymentIntentModel.clientSecret!);
    await presentPaymentSheet();
  }
}

  // PaymentIntentObject createPaymentIntent(int amount, enum currency)
  // initPaymentSheet(paymentIntentClientSecret)
  // presentPaymentSheet()
