import 'package:flutter/material.dart';

abstract class ILoginValidator {
  final GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();

  bool validate();
}
