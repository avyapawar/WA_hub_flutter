import 'package:flutter/material.dart';
import 'package:wp_hub_flutter/const/constants.dart';

class ForgotPasswordViewModel with ChangeNotifier{
    static final ForgotPasswordViewModel _instance = ForgotPasswordViewModel._internal();
  factory ForgotPasswordViewModel() => _instance;
  ForgotPasswordViewModel._internal();

void onTapAlredyAccound(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(K.appRuotes.login) ;
  }

}