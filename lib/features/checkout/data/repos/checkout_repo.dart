import 'package:checkout_app/core/errors/failures.dart';
import 'package:checkout_app/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_app/features/checkout/data/models/stripe_customer_input_model.dart';
import 'package:checkout_app/features/checkout/data/models/stripe_customer_model/stripe_customer_model.dart';
import 'package:dartz/dartz.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
    required String customerId,
  });

  Future<Either<Failure, StripeCustomerModel>> createCustomer(
      {required StripeCustomerInputModel stripeCustomerInputModel});
}
