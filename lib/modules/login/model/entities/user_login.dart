import 'package:login_test/src/domain/entities/user.dart';

class UserLogin extends User {
  UserLogin({
    required String email,
    required String password,
  }) : super(
          email: email.toLowerCase().trim(),
          password: password.trim(),
        );
}
