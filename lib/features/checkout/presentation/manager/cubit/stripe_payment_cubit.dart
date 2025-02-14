import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:checkout_app/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_app/features/checkout/data/repos/checkout_repo.dart';
import 'package:meta/meta.dart';

part 'stripe_payment_state.dart';

class StripePaymentCubit extends Cubit<StripePaymentState> {
  StripePaymentCubit(this.checkoutRepo) : super(StripePaymentInitial());

  final CheckoutRepo checkoutRepo;

  Future<void> makePayment(
      PaymentIntentInputModel paymentIntentInputModel) async {
    emit(StripePaymentLoading());
    final result = await checkoutRepo.makePayment(
        paymentIntentInputModel: paymentIntentInputModel);
    result.fold(
      (l) => emit(StripePaymentError(l.errMessage)),
      (r) => emit(StripePaymentSuccess()),
    );
  }

  @override
  void onChange(Change<StripePaymentState> change) {
    log('------ StripePaymentCubit ------ $change');
    super.onChange(change);
  }
}
