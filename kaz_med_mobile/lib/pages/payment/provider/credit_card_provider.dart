import 'package:flutter/material.dart';
import 'package:kaz_med/base/base_bloc.dart';

class CreditCardProvider extends BaseBloc {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
}
