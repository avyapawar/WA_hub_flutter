import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wp_hub_flutter/const/constants.dart';
import 'package:wp_hub_flutter/model/user_model.dart';
import 'package:wp_hub_flutter/repository/login_repository.dart';
import 'package:wp_hub_flutter/util/utils.dart';
import 'package:wp_hub_flutter/view_model/user_view_model.dart';
import 'package:email_validator/email_validator.dart';

class LoginViewModel with ChangeNotifier {
   static final LoginViewModel _instance = LoginViewModel._internal();
  factory LoginViewModel() => _instance;
  LoginViewModel._internal();
  final LoginRepository _loginRepository = LoginRepository();
  
  bool _loading = false ;
  bool get loading => _loading ;
  bool _isLoadingForgotPassword = false ;
    bool get forgotLoading => _isLoadingForgotPassword ;

   setLoading(bool value)async{
    _loading = value;
    notifyListeners();
 await Future.delayed(const Duration(seconds: 1)) ;
  }

  setForgotLoading(bool value)async{
    _isLoadingForgotPassword = value;
    notifyListeners();
 await Future.delayed(const Duration(seconds: 5)) ;
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
   setLoading(true) ;
    _loginRepository.loginApi(data).then((value) async {
   
      if ((value['statusCode'] == 200)) {
        final userPreference =
            Provider.of<UserViewModel>(context, listen: false);
        userPreference
            .saveUser(Data(accessToken: value['data']['access_token']));
        WPUtils.flushBarMessage('login Successfully', context);
        await Future.delayed(const Duration(seconds: 1)) ;
          setLoading(false) ;
          
     // ignore: use_build_context_synchronously
     await   Navigator.of(context).pushNamedAndRemoveUntil(K.appRuotes.home, (route) => false);
      } else {
        WPUtils.flushBarErrorMessage(value['message'], context);
      }
      setLoading(false) ;
    }).onError((error, stackTrace) {
      setLoading(false);
      WPUtils.flushBarErrorMessage(error.toString(), context);
    });
   
  }

  Future<void> onTapLogin(
      String email, String password, BuildContext context) async {
      
   
    if (email.isEmpty) {
      WPUtils.flushBarErrorMessage('Please enter email', context);
     
    } else if (!EmailValidator.validate(email)) {
      WPUtils.flushBarErrorMessage('Please enter valid email', context);
     
    } else if (password.isEmpty) {
      WPUtils.flushBarErrorMessage('Please enter password', context);
  
    } else if (password.length < 6) {
      WPUtils.flushBarErrorMessage('Please enter 6 digit password', context);
      
    } else {
      Map data = {
        //  "email": "dgupta@inspeero.com",
        //  "password": "Durgesh@123"
        K.jsonKeys.email: email.toString(),
         K.jsonKeys.password : password.toString(),
      };
      loginApi(data, context);
    }
  }

  Future<void> forgotPasswordApi(String email, BuildContext context) async {
    setForgotLoading(true);
   
    _loginRepository.forgotPassword(email).then((value) async {
      WPUtils.flushBarMessage(value['message'], context);
          setForgotLoading(false);

      await Future.delayed(const Duration(seconds: 2));
      // ignore: use_build_context_synchronously
       Navigator.pop(context) ;
    }).onError((error, stackTrace) {
          setForgotLoading(false);

      WPUtils.flushBarErrorMessage(error.toString(), context);
    });
  
  }

  Future<void> onTapSensEmail(String email, BuildContext context) async {
    if (email.isEmpty) {
      WPUtils.flushBarErrorMessage('Please enter email', context);
    } else if (!EmailValidator.validate(email)) {
      WPUtils.flushBarErrorMessage('Please enter valid email', context);
    } else {
      forgotPasswordApi(email, context);
    }
  }
   void onTapForgotPassword(BuildContext context) {
    Navigator.of(context).pushNamed(K.appRuotes.forgotPassword) ;
  }
}
