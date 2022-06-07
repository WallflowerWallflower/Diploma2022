import 'package:flutter/material.dart';
import 'package:kaz_med/base/base_bloc.dart';
import 'package:kaz_med/pages/payment/ui/credit_card.dart';

class PaymentProvider extends BaseBloc {
  toCreditCard(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const CreditCard()));
  }
}
