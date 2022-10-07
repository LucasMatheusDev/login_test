import 'package:get/get.dart';
import 'package:login_test/modules/login/model/data/data_source/login_data_source_imp.dart';
import 'package:login_test/modules/login/model/login_validator_imp.dart';
import 'package:login_test/modules/login/model/repositories/login_repository_imp.dart';
import 'package:login_test/modules/login/view/login_controller.dart';
import 'package:login_test/modules/login/view/show_snackbar_imp.dart';
import 'package:login_test/modules/login/view_model/login_view_model.dart';
import 'package:login_test/src/domain/interface/login_controller.dart';
import 'package:login_test/src/domain/interface/login_data_source.dart';
import 'package:login_test/src/domain/interface/login_repository.dart';
import 'package:login_test/src/domain/interface/login_view_model.dart';
import 'package:login_test/src/domain/interface/show_snackbar.dart';
import 'package:login_test/src/domain/interface/validator_login.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ILoginDataSource>(
      () => LoginDataSourceImp(),
    );
    Get.lazyPut<ILoginValidator>(
      () => LoginValidatorImp(),
    );
    Get.lazyPut<IShowSnackBar>(
      () => ShowSnackBarImp(
      ),
    );
    Get.lazyPut<ILoginRepository>(
      () => LoginRepositoryImp(
        dataSource: Get.find(),
      ),
    );
    Get.lazyPut<ILoginViewModel>(
      () => LoginViewModel(
        repository: Get.find(),
      ),
    );
    Get.lazyPut<ILoginController>(
      () => LoginController(
        loginViewModel: Get.find(),
        validator: Get.find(),
        snackbar: Get.find(),
      ),
    );
  }
}
