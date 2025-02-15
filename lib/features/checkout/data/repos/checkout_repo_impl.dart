import 'dart:developer';

import 'package:checkout_app/core/errors/failures.dart';
import 'package:checkout_app/core/services/stripe_payment_service.dart';
import 'package:checkout_app/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_app/features/checkout/data/models/stripe_customer_input_model.dart';
import 'package:checkout_app/features/checkout/data/models/stripe_customer_model/stripe_customer_model.dart';
import 'package:checkout_app/features/checkout/data/repos/checkout_repo.dart';
import 'package:dartz/dartz.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final StripePaymentService _stripePaymentService;

  CheckoutRepoImpl(this._stripePaymentService);

  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel,
      required String customerId}) async {
    try {
      await _stripePaymentService.makePayment(
        paymentIntentInputModel: paymentIntentInputModel,
        customerId: customerId,
      );
      return right(null);
    } catch (e) {
      log(e.toString());
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, StripeCustomerModel>> createCustomer(
      {required StripeCustomerInputModel stripeCustomerInputModel}) async {
    try {
      StripeCustomerModel stripeCustomerModel = await _stripePaymentService
          .createCustomer(stripeCustomerInputModel: stripeCustomerInputModel);
      return right(stripeCustomerModel);
    } catch (e) {
      log(e.toString());
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }
}
