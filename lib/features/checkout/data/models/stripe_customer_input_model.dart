class StripeCustomerInputModel {
  final String name;
  final String email;
  final String phone;

  StripeCustomerInputModel({
    required this.name,
    required this.email,
    required this.phone,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'phone': phone,
      };
}
