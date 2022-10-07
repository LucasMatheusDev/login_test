import 'package:login_test/modules/login/model/entities/user_login.dart';
import 'package:login_test/src/domain/entities/communication.dart';
import 'package:login_test/src/domain/interface/login_repository.dart';
import 'package:login_test/src/domain/interface/login_view_model.dart';

class LoginViewModel implements ILoginViewModel {
  final ILoginRepository _repository;

  LoginViewModel({
    required ILoginRepository repository,
  }) : _repository = repository;

  @override
  Future<Communication> login({
    required String email,
    required String password,
  }) async {
    final user = UserLogin(
      email: email,
      password: password,
    );
    return await _repository.login(
      user: user,
    );
  }
}
