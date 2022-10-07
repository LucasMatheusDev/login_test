abstract class ILoginDataSource {
  Future<bool> login({
    required String email,
    required String password,
  });
}
