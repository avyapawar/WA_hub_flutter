import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:wp_hub_flutter/const/constants.dart';
import 'package:wp_hub_flutter/view/forgot_password_screen.dart';
import 'package:wp_hub_flutter/view/home_screen.dart';
import 'package:wp_hub_flutter/view/login_screen.dart';
import 'package:wp_hub_flutter/view/welcome_page.dart';
import 'package:wp_hub_flutter/view_model/forgot_password_view_model.dart';
import 'package:wp_hub_flutter/view_model/home_screen_view_model.dart';
import 'package:wp_hub_flutter/view_model/login_view_model.dart';
import 'package:wp_hub_flutter/view_model/user_view_model.dart';
import 'package:wp_hub_flutter/view_model/welcome_page_view_model.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => LoginViewModel()),
    ChangeNotifierProvider(create: (_) => UserViewModel()),
    ChangeNotifierProvider(create: (_) => WelcomePageViewModel()),
    ChangeNotifierProvider(create: (_) => HomeScreenViewModel()),
    ChangeNotifierProvider(create: (_) => ForgotPasswordViewModel())
  ], child: getMaterialApp()));
}

GetMaterialApp getMaterialApp() {
  return GetMaterialApp(
    // translations: LocaleString(),
    // locale:  const Locale('en','IN'),

    debugShowCheckedModeBanner: false,
    initialRoute: K.appRuotes.welcome,
    routes: {
      K.appRuotes.welcome: (context) => const WelcomePage(),
      K.appRuotes.login: (context) => const LoginScreen(),
      K.appRuotes.home: (context) => const HomeScreen(),
      K.appRuotes.forgotPassword: (context) => const ForgotPasswordScreen(),
    },
  );
}
