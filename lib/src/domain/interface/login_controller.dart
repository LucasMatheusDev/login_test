import 'package:flutter/cupertino.dart';

abstract class ILoginController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login();

  
  Key? get formKeyLogin;
}
