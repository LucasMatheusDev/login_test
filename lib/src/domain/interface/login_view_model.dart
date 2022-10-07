import 'package:login_test/src/domain/entities/communication.dart';

abstract class ILoginViewModel {
  Future<Communication> login({
    required String email,
    required String password,
  });
}