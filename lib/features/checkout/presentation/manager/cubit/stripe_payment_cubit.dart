import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:checkout_app/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_app/features/checkout/data/models/stripe_customer_input_model.dart';
import 'package:checkout_app/features/checkout/data/repos/checkout_repo.dart';
import 'package:meta/meta.dart';

part 'stripe_payment_state.dart';

class StripePaymentCubit extends Cubit<StripePaymentState> {
  StripePaymentCubit(this.checkoutRepo) : super(StripePaymentInitial());

  final CheckoutRepo checkoutRepo;

  Future<void> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
    required String customerId,
  }) async {
    emit(StripePaymentLoading());
    final result = await checkoutRepo.makePayment(
      paymentIntentInputModel: paymentIntentInputModel,
      customerId: customerId,
    );
    result.fold(
      (l) => emit(StripePaymentError(l.errMessage)),
      (r) => emit(StripePaymentSuccess()),
    );
  }

  Future<void> createCustomer(
      StripeCustomerInputModel stripeCustomerInputModel) async {
    emit(StripePaymentLoading());
    final result = await checkoutRepo.createCustomer(
        stripeCustomerInputModel: stripeCustomerInputModel);
    result.fold(
      (l) => emit(StripePaymentError(l.errMessage)),
      (r) => emit(StripePaymentSuccess()),
    );
  }

  @override
  void onChange(Change<StripePaymentState> change) {
    log('------ CreateCustomer ------ $change');
    super.onChange(change);
  }
}
