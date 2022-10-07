import 'package:flutter/material.dart';
import 'package:login_test/src/domain/interface/validator_login.dart';

class LoginValidatorImp implements ILoginValidator {
  final GlobalKey<FormState> _formKeyLogin = GlobalKey<FormState>();
  @override
  GlobalKey<FormState> get formKeyLogin => _formKeyLogin;

  @override
  bool validate() {
    return formKeyLogin.currentState?.validate() ?? false;
  }
}
