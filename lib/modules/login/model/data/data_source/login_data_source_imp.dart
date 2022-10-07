import 'package:login_test/src/domain/interface/login_data_source.dart';

class LoginDataSourceImp implements ILoginDataSource {
  final fakeUsers = {
    "email": "lucas123@gmail.com",
    "password": "123456",
  };
  @override
  Future<bool> login({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 2));
    if (fakeUsers["email"] == email && fakeUsers["password"] == password) {
      return true;
    } else {
      return false;
    }
  }
}
