import 'package:bconnect_formulario/app.dart';
import 'package:bconnect_formulario/helpers/preferences_helper.dart';
import 'package:bconnect_formulario/views/auth_view.dart';
import 'package:bconnect_formulario/views/Formulario/formulario_view.dart';
import 'package:bconnect_formulario/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    App(
      home: await initApp(),
      builder: EasyLoading.init(),
    ),
  );
}

Future<Widget?> initApp() async {
  final token = Uri.base.queryParameters["access_token"];
  final code = Uri.base.queryParameters["access_code"];
  if (token != null || code != null) {
    return AuthPage(token: token, code: code);
  }

  final String? preferenceToken = await PreferencesHelper.getString('token');
  if ((preferenceToken ?? '') == '') {
    return const LoginPage();
  }
  return const CapacitacionPage();
}
