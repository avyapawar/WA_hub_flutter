import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wp_hub_flutter/model/user_model.dart';

class UserViewModel with ChangeNotifier {
  static final UserViewModel _instance = UserViewModel._internal();
  factory UserViewModel() => _instance;
  UserViewModel._internal();
  Future<bool> saveUser(Data userData) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('access_token', userData.accessToken.toString());
    notifyListeners();
    return true;
  }

  Future<Data> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('access_token');

    return Data(accessToken: token.toString());
  }

 Future<String> accesToken()async {
  final accesToken =
        await getUser().then((value) => value.accessToken);
   
    return accesToken! ;
  }

  Future<bool> removeUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('access_token');
    return true;
  }
}
