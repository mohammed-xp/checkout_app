import 'package:checkout_app/core/api_keys.dart';
import 'package:checkout_app/core/services/api_service.dart';
import 'package:checkout_app/features/checkout/data/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:checkout_app/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_app/features/checkout/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:checkout_app/features/checkout/data/models/stripe_customer_input_model.dart';
import 'package:checkout_app/features/checkout/data/models/stripe_customer_model/stripe_customer_model.dart';
import 'package:checkout_app/features/checkout/data/models/stripe_init_payment_sheet_input_model.dart';
import 'package:dio/dio.dart';
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
      contentType: Headers.formUrlEncodedContentType,
      token: ApiKeys.stripeSecretKey,
    );

    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);

    return paymentIntentModel;
  }

  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    const String url = 'https://api.stripe.com/v1/ephemeral_keys';

    var response = await _apiService.post(
      url: url,
      body: {'customer': customerId},
      contentType: Headers.formUrlEncodedContentType,
      token: ApiKeys.stripeSecretKey,
      headers: {'Stripe-Version': '2025-01-27.acacia'},
    );

    EphemeralKeyModel ephemeralKeyModel =
        EphemeralKeyModel.fromJson(response.data);

    return ephemeralKeyModel;
  }

  Future<void> initPaymentSheet({
    required StripeInitPaymentSheetInputModel stripeInitPaymentSheetInputModel,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        // Main params
        merchantDisplayName: 'Mohammed Adil',
        paymentIntentClientSecret:
            stripeInitPaymentSheetInputModel.paymentIntentClientSecret,
        customerId: stripeInitPaymentSheetInputModel.customerId,
        customerEphemeralKeySecret:
            stripeInitPaymentSheetInputModel.customerEphemeralKeySecret,
      ),
    );
  }

  Future<void> presentPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future<void> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
    required String customerId,
  }) async {
    PaymentIntentModel paymentIntentModel =
        await createPaymentIntent(paymentIntentInputModel);

    EphemeralKeyModel ephemeralKeyModel =
        await createEphemeralKey(customerId: customerId);
    await initPaymentSheet(
      stripeInitPaymentSheetInputModel: StripeInitPaymentSheetInputModel(
        paymentIntentClientSecret: paymentIntentModel.clientSecret!,
        customerId: customerId,
        customerEphemeralKeySecret: ephemeralKeyModel.secret!,
      ),
    );
    await presentPaymentSheet();
  }

  Future<StripeCustomerModel> createCustomer(
      {required StripeCustomerInputModel stripeCustomerInputModel}) async {
    const String url = 'https://api.stripe.com/v1/customers';

    var response = await _apiService.post(
      url: url,
      body: stripeCustomerInputModel.toJson(),
      contentType: Headers.formUrlEncodedContentType,
      token: ApiKeys.stripeSecretKey,
    );

    StripeCustomerModel stripeCustomerModel =
        StripeCustomerModel.fromJson(response.data);

    return stripeCustomerModel;
  }
}
  // PaymentIntentObject createPaymentIntent(amount, currency, customerId)

  // createEphemeralKey(customerId, Stripe-Version)

  // initPaymentSheet(merchantDisplayName, clientSecret, ephemeralKey)
  
  // presentPaymentSheet()
