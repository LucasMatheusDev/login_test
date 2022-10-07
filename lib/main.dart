import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_test/modules/login/binding/login_bindings.dart';
import 'package:login_test/modules/login/view/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      getPages: [
        GetPage(
          name: '/login',
          page: () => LoginView(
            controller: Get.find(),
          ),
          binding: LoginBindings(),
        ),
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/login",
    );
  }
}
