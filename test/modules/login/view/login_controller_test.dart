import 'package:flutter_test/flutter_test.dart';
import 'package:login_test/modules/login/view/login_controller.dart';
import 'package:login_test/src/domain/entities/communication.dart';
import 'package:login_test/src/domain/interface/login_view_model.dart';
import 'package:login_test/src/domain/interface/show_snackbar.dart';
import 'package:login_test/src/domain/interface/validator_login.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_controller_test.mocks.dart';

@GenerateMocks([
  ILoginViewModel,
  ILoginValidator,
  IShowSnackBar,
])
void main() {
  group('login controller ...', () {
    test("Login with success", () async {
      final loginViewModelFake = MockILoginViewModel();
      final validatorFake = MockILoginValidator();
      final snackbarFake = MockIShowSnackBar();

      final controller = LoginController(
        loginViewModel: loginViewModelFake,
        validator: validatorFake,
        snackbar: snackbarFake,
      );

      when(validatorFake.validate()).thenReturn(true);

      when(loginViewModelFake.login(
        email: anyNamed("email"),
        password: anyNamed("password"),
      )).thenAnswer((_) async => Communication(success: true));

      await controller.login();

      verify(loginViewModelFake.login(
        email: anyNamed("email"),
        password: anyNamed("password"),
      )).called(1);

      verifyNever(snackbarFake.show(any));
    });
    test("Login with error", () async {
      final loginViewModelFake = MockILoginViewModel();
      final validatorFake = MockILoginValidator();
      final snackbarFake = MockIShowSnackBar();
      const messageError = 'Erro ao realizar login 458';
      final controller = LoginController(
        loginViewModel: loginViewModelFake,
        validator: validatorFake,
        snackbar: snackbarFake,
      );

      when(validatorFake.validate()).thenReturn(true);

      when(loginViewModelFake.login(
        email: anyNamed("email"),
        password: anyNamed("password"),
      )).thenAnswer((_) async => Communication(
            success: false,
            message: messageError,
          ));

      await controller.login();

      verify(loginViewModelFake.login(
        email: anyNamed("email"),
        password: anyNamed("password"),
      )).called(1);

      verify(snackbarFake.show(messageError)).called(1);
    });

    test("Login with user", () async {
      final loginViewModelFake = MockILoginViewModel();
      final validatorFake = MockILoginValidator();
      final snackbarFake = MockIShowSnackBar();
      const email = 'lucas@gmail.com';
      const password = '123456';

      final controller = LoginController(
        loginViewModel: loginViewModelFake,
        validator: validatorFake,
        snackbar: snackbarFake,
      );

      controller.emailController.text = email;
      controller.passwordController.text = password;

      when(validatorFake.validate()).thenReturn(true);

      when(loginViewModelFake.login(
        email: email,
        password: password,
      )).thenAnswer((_) async => Communication(success: true));

      await controller.login();

      verify(loginViewModelFake.login(
        email: email,
        password: password,
      )).called(1);

      verifyNever(snackbarFake.show(any));
    });
  });
}
