import 'package:login_test/src/domain/entities/communication.dart';
import 'package:login_test/src/domain/entities/user.dart';

abstract class ILoginRepository<T extends User> {
  Future<Communication> login({
    required T user,
  });
}
