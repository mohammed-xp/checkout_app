import 'package:checkout_app/core/services/api_service.dart';
import 'package:checkout_app/core/services/stripe_payment_service.dart';
import 'package:checkout_app/features/checkout/data/repos/checkout_repo.dart';
import 'package:checkout_app/features/checkout/data/repos/checkout_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<ApiService>(ApiService());

  getIt.registerSingleton<StripePaymentService>(
      StripePaymentService(getIt<ApiService>()));

  getIt.registerSingleton<CheckoutRepo>(
      CheckoutRepoImpl(getIt.get<StripePaymentService>()));
}
