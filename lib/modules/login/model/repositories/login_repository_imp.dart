import 'package:login_test/src/domain/entities/communication.dart';
import 'package:login_test/src/domain/entities/user.dart';
import 'package:login_test/src/domain/interface/login_data_source.dart';
import 'package:login_test/src/domain/interface/login_repository.dart';

class LoginRepositoryImp implements ILoginRepository {
  final ILoginDataSource dataSource;

  LoginRepositoryImp({required this.dataSource});

  @override
  Future<Communication<String?>> login({
    required User user,
  }) async {
    try {
      final response = await dataSource.login(
        email: user.email,
        password: user.password,
      );
      if (response) {
        return Communication(
          success: response,
          message: "Login realizado com sucesso" ,
        );
      } else {
        return Communication(
          success: response,
          message: "Login inválido",
        );
      }
    } catch (e) {
      return Communication(
        success: false,
        message: "Erro ao realizar login",
      );
    }
  }
}
