import 'package:checkout_app/features/checkout/presentation/manager/cubit/stripe_payment_cubit.dart';
import 'package:checkout_app/features/checkout/presentation/views/thank_you_view.dart';
import 'package:checkout_app/features/checkout/presentation/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/payment_intent_input_model.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StripePaymentCubit, StripePaymentState>(
      listener: (context, state) {
        if (state is StripePaymentSuccess) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const ThankYouView(),
            ),
          );
        }
        if (state is StripePaymentError) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },
      builder: (context, state) {
        return CustomButton(
          title: 'Continue',
          isLoading: state is StripePaymentLoading,
          onPressed: () {
            final paymentIntentInputModel = PaymentIntentInputModel(
              amount: 50.97,
              currency: 'usd',
              customerId: 'cus_RmDjc835tslA7n',
            );
            context.read<StripePaymentCubit>().makePayment(
                  paymentIntentInputModel: paymentIntentInputModel,
                  customerId: 'cus_RmDjc835tslA7n',
                );
          },
        );
      },
    );
  }
}
