import 'package:flutter/cupertino.dart';
import 'package:login_test/src/domain/interface/login_controller.dart';
import 'package:login_test/src/domain/interface/login_view_model.dart';
import 'package:login_test/src/domain/interface/show_snackbar.dart';
import 'package:login_test/src/domain/interface/validator_login.dart';

class LoginController implements ILoginController {
  @override
  final TextEditingController emailController = TextEditingController();

  @override
  final TextEditingController passwordController = TextEditingController();

  final PageController pageController = PageController();

  final ILoginViewModel _loginViewModel;

  final ILoginValidator _validator;

  final IShowSnackBar _snackbar;

  @override
  get formKeyLogin => _validator.formKeyLogin;

  LoginController({
    required ILoginViewModel loginViewModel,
    required ILoginValidator validator,
    required IShowSnackBar snackbar,
  })  : _loginViewModel = loginViewModel,
        _snackbar = snackbar,
        _validator = validator;

  @override
  Future<void> login() async {
    if (_validator.validate()) {
      final response = await _loginViewModel.login(
        email: emailController.text,
        password: passwordController.text,
      );
      if (response.success) {
        debugPrint("Login realizado com sucesso");
      } else {
        debugPrint("Login inválido");
        _snackbar.show(
          response.message ?? "Erro ao realizar login",
        );
      }
    }
  }
}
