import 'package:flutter/material.dart';
import 'package:kaz_med/base/base_bloc.dart';
import 'package:kaz_med/pages/auth/ui/auth_page.dart';

class LogoutProvider extends BaseBloc {
  Size? size;

  void exit(BuildContext context) {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (_) => const AuthPage()), (route) => false);
  }
}
